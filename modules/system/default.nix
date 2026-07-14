# modules/system/default.nix
{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./kernel.nix
    ./nix.nix
    #./tmpfs.nix
    ./ld.nix
    ./packages.nix
    ./info-fetch.nix
    ./keyboard.nix
    ./environment-variables.nix
    ./configuration.nix
  ];
}
