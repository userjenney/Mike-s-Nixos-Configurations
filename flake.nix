{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #impermanence.url = "github:nix-community/impermanence";
    rust-overlay.url = "github:oxalica/rust-overlay";
    #wezterm.url = "github:wez/wezterm?dir=nix";
    #hyprland.url = "github:hyprwm/Hyprland";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      self,
      nur,
      ...
    }:
    {
      nixosConfigurations = {
        # 这里的 turing 替换成你的主机名称
        turing = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts
            ./modules/system
            ./modules/desktop
            ./modules/network
            ./modules/development
            ./modules/user

            # Adds the NUR overlay
            nur.modules.nixos.default

            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [
                  (final: prev: {
                    # 这种写法会拦截所有的 openldap 编译
                    openldap = prev.openldap.overrideAttrs (old: {
                      doCheck = false;
                    });
                  })
                ];

                # 针对 Lutris 及其 32 位依赖的特殊处理
                # 强制在全局禁用 checkPhase（仅针对 openldap）
                nixpkgs.config.packageOverrides = pkgs: {
                  openldap = pkgs.openldap.overrideAttrs (old: {
                    doCheck = false;
                  });
                };
              }
            )

            {
              _module.args = { inherit inputs; };
            }
            # 将 home-manager 配置为 nixos 的一个 module
            # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              # 这里的 nic 也得替换成你的用户名
              # 这里的 import 函数在前面 Nix 语法中介绍过了，不再赘述
              home-manager.users.nic = import ./home-manager;

              # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
              # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
              # home-manager.extraSpecialArgs = { inherit inputs; };
            }

            #(
            # { pkgs, ... }:
            #{
            # nixpkgs.overlays = [ (import ./modules/overlays) ];
            #}
            #)
          ];
        };
      };
    };
}
