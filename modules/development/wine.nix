{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wineWow64Packages.unstable
    winetricks
  ];
}
