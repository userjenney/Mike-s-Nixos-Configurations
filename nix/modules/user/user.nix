{ config, lib, pkgs, ... }:

{
  users.users.nic = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$riuS4fG5mYWmq.pdcJ6Zp/$ZJf6LQvGFdEYrXt7eQd1t.n3TI/XhnRuJb46eUHiSB2";
    extraGroups = [ "wheel" "adbusers" "audio" "video" "networkmanager" "input" "tss" "libvirtd" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      #
    ];
  };
}
