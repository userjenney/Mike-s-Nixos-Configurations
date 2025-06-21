{ pkgs, ... }:

{
  environment.systemPackages =  with pkgs; [
    wineWowPackages.unstable
  ]; 
}
