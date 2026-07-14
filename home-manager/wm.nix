{
  pkgs,
  inputs,
  config,
  ...
}:
{
  wayland.windowManager.hyprland = {
    systemd.enable = false;
    settings = {
      decoration = {
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
      };

      "$mod" = "SUPER";

      bind = [
        # Execute Rofi with only the SUPER key
        #"$mod, s, exec, pkill rofi || rofi -show drun"

        "$mod, F, exec, librewolf"

        "CONTROL ALT, T, exec, wezterm"
      ];

      # Startup Apps
      exec-once = [
        "hyprpanel"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

      ];

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
    };
  };

  home.packages = with pkgs; [
    hyprlauncher
    nitrogen
    i3-volume
  ];

  programs.rofi = {
    enable = true;
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          bg0 = mkLiteral "#000000";
          fg0 = mkLiteral "#ffffff";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg0"; # 修复此处
        };
        # 下面如果用到变量，同理
        "element selected" = {
          background-color = mkLiteral "#333333";
          text-color = mkLiteral "@fg0";
        };
      };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "Password...";
          shadow_passes = 2;
        }
      ];
    };
  };

  programs.waybar = {
    enable = false;
  };

  xsession.windowManager.i3 = {
    config.bars.mode = "";
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            alert = 10.0;
            block = "disk_space";
            info_type = "available";
            interval = 60;
            path = "/";
            warning = 20.0;
          }
          {
            block = "memory";
            format = " $icon mem_used_percents ";
            format_alt = " $icon $swap_used_percents ";
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "load";
            format = " $icon $1m ";
            interval = 1;
          }
          {
            block = "sound";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R:%S') ";
            interval = 1;
          }
        ];
      };
    };
  };
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.65;
      dynamic_background_opacity = "yes";
      enable_audio_bell = false;
      scrollback_lines = 10000;
      update_check_interval = 0;
      NO_COLOR = 1;
    };
    extraConfig = "";
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 21;
    };
    keybindings = {
      "ctrl+page_up" = "previous_tab";
      "ctrl+page_down" = "next_tab";
    };
  };

}
