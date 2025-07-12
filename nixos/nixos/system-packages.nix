{ pkgs, ...}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kdePackages.ark
    nekoray
    neofetch
    htop
    hmcl
    hardinfo2
    telegram-desktop
    wechat-uos
    tree
    steam-run
    vlc
    telegram-desktop
    tor-browser
    ppsspp
    ungoogled-chromium
    qbittorrent-enhanced
    foliate
    jamesdsp
    kdePackages.kate
    qq
    nix-output-monitor
    syncyomi
    libreoffice
    xterm
    helvum
    sassc
    ulauncher
    xfce.xfce4-panel-profiles
    xfce.xfce4-docklike-plugin
    conky
    glava
    picom
    nmap
    android-tools
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.aloowBroken = true;
}
