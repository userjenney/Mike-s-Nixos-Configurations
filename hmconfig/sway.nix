{ pkgs, lib, config, ... }:

{
   wayland.windowManager.sway = {
     extraConfig = "
     ";
     config.bars = [];
     config.modifier = "Mod4";
     config.keybindings = lib.mkOptionDefault {
       "${config.wayland.windowManager.sway.config.modifier}+p" = "exec grim -g ${pkgs.slurp} - | wl-copy";
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

}
