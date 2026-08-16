{ pkgs, ... }:

{
  programs.lutris.enable = true;

  home.packages = with pkgs; [
    pcmanfm
    mpv
    fooyin
    kdePackages.elisa
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
    obs-studio
    throne
    hardinfo2
    telegram-desktop
    tor-browser
    ppsspp
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
    nethack
    openra
    openspades
  ];

  programs.firefox = {
    enable = true;
  };

  programs.librewolf = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      "--enable-logging=stderr"
      "--ignore-gpu-blocklist"
    ];
    dictionaries = [
      pkgs.hunspellDictsChromium.en_US
    ];
    nativeMessagingHosts = [
      pkgs.keepassxc
    ];
  };
}
