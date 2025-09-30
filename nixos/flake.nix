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
    wezterm.url = "github:wez/wezterm?dir=nix";
  };

  outputs = inputs@{ nixpkgs, home-manager, self, ... }: {
    nixosConfigurations = {
      # 这里的 my-nixos 替换成你的主机名称
      Turing = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        #specialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./fhs.nix
          ./opengl.nix
          ./keyboard.nix
          ./info-fetch.nix
          ./wasm.nix
          ./windowmanager.nix
          ./proxy.nix
          ./flatpak.nix
          ./console-utils.nix
          ./utils.nix
          ./user.nix
          ./boot.nix
          ./wine.nix
          ./nix-ld.nix
          ./rust.nix 
          ./lsp.nix
          #./tmpfs.nix
          ./kernel.nix
          ./audio.nix
          ./nix.nix
          ./desktop.nix
          ./environment-variables.nix
          ./system-packages.nix
          ./fonts.nix
          ./game.nix

          {
            _module.args = {inherit inputs;};
          }

          # 将 home-manager 配置为 nixos 的一个 module
          # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # 这里的 nic 也得替换成你的用户名
            # 这里的 import 函数在前面 Nix 语法中介绍过了，不再赘述
            home-manager.users.nic = import ./home-manager/home.nix;

            # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
            # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
            home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
    };
  };
}
