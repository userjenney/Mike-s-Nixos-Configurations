{ pkgs, ... }:

{
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



  programs.waybar.enable = true;
  programs.waybar.systemd.target = "sway-session.target";

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
}
