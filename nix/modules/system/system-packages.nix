{ pkgs, ...}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    fastfetch
    ffmpeg
    steam-run
    android-tools
    joe
    conky
    picom
    sassc
    xfce4-docklike-plugin
    xfce.xfce4-panel-profiles
    syncyomi
    neofetch
    htop
    tree
    nix-output-monitor
    nmap
    home-manager
    zfs
    zfstools
    pkg-config
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.aloowBroken = true;


  

  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
}
