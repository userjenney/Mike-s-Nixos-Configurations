{ pkgs, lib, config, ... }:

{
   wayland.windowManager.sway = {
     extraConfig = "
       exec_always export EDITOR=vim
       exec waypaper --restore
      ";
     extraOptions = [
       "--verbose"
       "--debug"
     ];
     config.bars.mode = lib.mkForce "invisible";     
     config.modifier = "Mod4";
     config.keybindings = lib.mkOptionDefault {
       "${config.wayland.windowManager.sway.config.modifier}+p" = "exec grim -g ${pkgs.slurp} - | wl-copy";
     };
     config.fonts = {
       name = [ "noto cjk sans" ];
       style = "noto-fonts-cjk-sans";
       size = 16.0;
     };
   };

   programs.waybar = {
     settings = {
         "layer" = "top"; #// Waybar at top layer
         "position" = "top"; #// Waybar position (top|bottom|left|right)
         "height" = 30;
         "margin" = "0 0 0 0";
         "width" = 1350; #// Waybar width
         #// Choose the order of the modules idle_inhibitor
         "modules-left" = [
         "custom/launcher"
         "sway/workspaces"
         "custom/swap"
         "tray"
         "sway/window"
         "sway/mode"
         "custom/cava-internal"
         "mpd#2"
         "mpd#3"
         "mpd#4"
         "mpd"
         ];
         "modules-center" = [ "clock" ];
         "modules-right" = [
         "backlight"
         "pulseaudio"
         "custom/keyboard-layout"
         "temperature"
         "cpu"
         "memory"
         "disk"
         "group/hardware"
         "battery"
         "network"
         "idle_inhibitor"
         "custom/power"
         ];


         #// Load Modules
         "include" = [ /home/nic/.config/waybar/modules-background.json ];
     };

     style = [
       /home/nic/.config/waybar/style-background.css
     ];     
  }; 

  programs.foot.settings = {
    main = {
      font = "Fira Code:size=12";
      dpi-aware = "auto";
      pad = "8x8 center";
      alpha = "0.85";
      inactive-alpha = "0.70";
      blur= "yes";
      blur-radius= "8";
    };
    colors = {
      foreground = "dddddd";
      background = "000000";
      selection-foreground = "ffffff";
      selection-background = "268bd2";
    };
  };

}
