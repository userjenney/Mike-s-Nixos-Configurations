{
  config,
  inputs,
  pkgs,
  ...
}:

{

  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  xresources.properties = {
    "Xcursor.size" = 10;
    "Xft.dpi" = 100;
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
  };

}
