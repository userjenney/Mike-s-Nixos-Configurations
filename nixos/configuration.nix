# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # do garbage collection weekly to keep disk usage low

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
    time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_TW.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-chewing
        fcitx5-chinese-addons
      ];
    };
  };

  # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.xserver.desktopManager.xfce.enable = true;
#
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      ubuntu_font_family
      liberation_ttf
      vazir-fonts
    ];

    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    fontconfig.enable = true;
    
    fontconfig = {
      defaultFonts = {
      serif = [  "Liberation Serif" "Vazirmatn" ];
      sansSerif = [ "Ubuntu" "Vazirmatn" ];
      monospace = [ "Ubuntu Mono" ];
      };
    };
  };
#

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # bluetooth settings
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;


  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
  ];
  # Allow unfree software 
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };




  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

  #nixos substituters
   nix = {
     settings = {
       substituters = [
         # cache mirror located in China
         # status: https://mirror.sjtu.edu.cn/
         #"https://mirror.sjtu.edu.cn/nix-channels/store"
         # status: https://mirrors.ustc.edu.cn/status/
         #"https://mirrors.ustc.edu.cn/nix-channels/store"
         "https://mirrors.cernet.edu.cn/nix-channels/store"
       ];

       trusted-public-keys = [
         # the default public key of cache.nixos.org, it's built-in, no need to add it here
         "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
       ]; 
       experimental-features = [ "nix-command" "flakes" ];
       auto-optimise-store = true;
    };

    channel = {
      enable = false;
    };
  };



  # system envieonment var
  environment.variables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    EDITOR = "vim";
  };

  # steam program
  programs.steam.enable = true;
  programs.steam.extraCompatPackages = with pkgs; [ proton-ge-bin ];




}

