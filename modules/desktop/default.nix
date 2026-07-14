# modules/desktop/default.nix
{ ... }:

{
  imports = [
    ./desktop.nix
    ./wm.nix
    ./opengl.nix
    ./fonts.nix
    ./flatpak.nix
    ./game.nix
  ];
}
