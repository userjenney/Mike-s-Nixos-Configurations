{ pkgs, ... }:

{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # kanshi systemd service
  /*
    systemd.user.services.kanshi = {
      description = "kanshi daemon";
      environment = {
        WAYLAND_DISPLAY="wayland-1";
        DISPLAY = ":0";
      };
      serviceConfig = {
        Type = "simple";
        ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
      };
    };
  */

  /*
    programs.sway = {
      enable = true;
      xwayland.enable = true;
      wrapperFeatures.base = true;
      wrapperFeatures.gtk = true;
      extraOptions = [
        "--verbose"
        "--debug"
        "--unsupported-gpu"
        ];
      extraPackages = with pkgs; [
        wl-clipboard
        mako
        brightnessctl
        foot
        grim
        swayidle
        swaylock
        wmenu
        slurp
        sway-launcher-desktop
        sway-contrib.grimshot
        swaybg
        waypaper
        wofi
      ];
    };
  */

  /*
    programs.uwsm = {
      enable = true;
      waylandCompositors = {
        sway = {
          prettyName = "Sway";
          comment = "Sway compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/sway";
        };
      };
    };
  */

  /*
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    programs.dms-shell = {
      enable = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;
      enableDynamicTheming = true;
      enableSystemMonitoring = true;
      systemd = {
        enable = true;
        target = "graphical-session.target";
        restartIfChanged = true;
      };
      quickshell.package = pkgs.quickshell;
    };
  */

  environment.systemPackages = with pkgs; [
    hyprshot
    dunst
    picom
    maim
    xclip
    libnotify
  ];

  services.xserver.windowManager.i3 = {
    enable = true;
    updateSessionEnvironment = true;
  };

  programs.i3lock = {
    enable = true;
  };

}
