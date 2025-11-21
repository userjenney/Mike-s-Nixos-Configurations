{ pkgs, ...}:

{
  programs.lutris.enable = true;
  
  home.packages = with pkgs;[
    amberol
    joe
    obs-studio
    nekoray
    hardinfo2
    telegram-desktop
    tor-browser
    ppsspp
    ungoogled-chromium
    qbittorrent-enhanced
    foliate
    kdePackages.ark
    hmcl
    steam-run
    vlc
    jamesdsp
    kdePackages.kate
    qq
    libreoffice
    xterm
    helvum
    kdePackages.dolphin
    pavucontrol
    just
    android-tools
    ulauncher
    conky
    glava
    picom
    sassc
    xfce.xfce4-docklike-plugin
    xfce.xfce4-panel-profiles
    syncyomi
    virtualbox
    wechat
    todesk
  ];
}
