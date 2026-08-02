{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    links2
    wget
    pahole
    rar
    p7zip
    fastfetch
    ffmpeg
    steam-run
    android-tools
    joe
    conky
    #picom
    sassc
    xfce4-docklike-plugin
    xfce4-panel-profiles
    syncyomi
    htop
    tree
    nix-output-monitor
    nmap
    home-manager
    zfs
    zfstools
    pkg-config
    gst_all_1.gstreamer
    gst_all_1.gst-libav
    nixfmt-tree
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.aloowBroken = true;
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") {
      inherit pkgs;
    };
  };

  programs.virt-manager.enable = true;
  virtualisation = {
    virtualbox.host.enable = true;
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
  };

  programs.nh = {
    enable = true;
    flake = "/etc/nixos/nix";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "-v --keep 10 --keep-since 1w --optimise";
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "idea-oss-2025.3.4"
  ];
}
