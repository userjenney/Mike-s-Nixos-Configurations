{ pkgs, ... }:

{
  programs.lutris.enable = true;

  home.packages = with pkgs; [
    wpsoffice-cn
    thunderbird
    genymotion
    anydesk
    discord
    geogebra
    jetbrains.rust-rover
    jetbrains.idea-oss
    microsoft-edge
    openboard
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
    #libreoffice
    xterm
    #helvum
    kdePackages.dolphin
    pavucontrol
    ulauncher
    virtualbox
    wechat
    todesk
    kdePackages.kdenlive
    openttd
  ];

  programs.firefox = {
    enable = true;
  };
}
