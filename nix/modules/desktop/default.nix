# modules/desktop/default.nix
{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
    ./wm.nix
    ./opengl.nix
    ./fonts.nix
    ./flatpak.nix
  ];
}
