{ ... }:

{
  # system envieonment var
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    EDITOR = "emacs -nw";
    DEVBOX_USE_VERSION = "0.15.0";
    NIXPKGS_ALLOW_UNFREE = 1;
    NIXPKGS_ALLOW_INSECURE = 1;
    NH_OS_FLAKE = "/etc/nixos/nix";
    NH_FLAKE = "/etc/nixos/nix";
    NH_NO_CHECKS = 1;
  };
}
