{ config, lib, pkgs, ... }:

{
  users.users.nic = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$LNA4dKecYh/BbeA5pX73Q1$60fKJAMZ6qQbrFeCe7n8tyUlFJamfHtZ3j3oE8g9Jq5";
    extraGroups = [ "wheel" "adbusers" "audio" "video" "networkmanager" "input" "tss" "libvirtd" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      #
    ];
  };
}
