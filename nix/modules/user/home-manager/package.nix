{ pkgs, ...}:

{
  programs.lutris.enable = true;
  
  home.packages = with pkgs;[
    xmind
    amberol
    obs-studio
    throne
    hardinfo2
    telegram-desktop
    tor-browser
    ppsspp
    ungoogled-chromium
    qbittorrent-enhanced
    foliate
    kdePackages.ark
    hmcl
    vlc
    jamesdsp
    kdePackages.kate
    qq
    libreoffice
    xterm
    helvum
    kdePackages.dolphin
    pavucontrol
    ulauncher
    virtualbox
    wechat
    todesk
  ];
}
