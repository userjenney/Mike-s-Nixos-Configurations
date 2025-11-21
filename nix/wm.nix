{ pkgs, ... }:

{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
# kanshi systemd service
  /*systemd.user.services.kanshi = {
    description = "kanshi daemon";
    environment = {
      WAYLAND_DISPLAY="wayland-1";
      DISPLAY = ":0";
    }; 
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };*/

  /*programs.sway = {
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
  };*/




  /*programs.uwsm = {
    enable = true;
    waylandCompositors = {
      sway = {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };    
  };*/

}
