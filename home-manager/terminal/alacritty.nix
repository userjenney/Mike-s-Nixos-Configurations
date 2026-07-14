# home.nix 中的 programs.alacritty 部分
{
  programs.alacritty = {
    enable = true;

    settings = {
      # 窗口设置
      window = {
        # 透明度 0.0 - 1.0
        opacity = 0.75;
        # 开启背景模糊（需合成器支持）
        blur = true;
        # 窗口装饰：透明标题栏
        decorations = "Transparent";
        # 启动时窗口尺寸
        dimensions = {
          columns = 120;
          lines = 30;
        };
        # 内边距
        padding = {
          x = 10;
          y = 10;
        };
      };

      # 字体配置
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        size = 20;
      };

      # 颜色主题（以 Catppuccin Mocha 为例）
      colors = {
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
        };
        normal = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };
        bright = {
          black = "#585b70";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#a6adc8";
        };
      };

      # 光标样式
      cursor.style = "Beam";

      # 滚动缓冲区
      scrolling.history = 10000;

      # Shell 启动（可选，使用默认 shell）
      # shell = {
      #   program = "fish";
      #   args = [ "--login" ];
      # };
    };
  };
}
