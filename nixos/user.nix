{ config, lib, pkgs, ... }:

{
  users.users.nic = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$ChGs/wDsXgk9NsQaNWh6G/$OMJHnCg5zhTmyujoWVHrhgOHNq1QLXjQncNRBw50NXB";
    extraGroups = [ "wheel" "adbusers" "audio" "video" "networkmanager" "input" "tss" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      #
    ];
  };
}
