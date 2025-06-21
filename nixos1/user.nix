{ config, lib, pkgs, ... }:

{
  users.users.nic = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" "audio" "video" "networkmanager" "input" "tss" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      #
    ];
  };
}
