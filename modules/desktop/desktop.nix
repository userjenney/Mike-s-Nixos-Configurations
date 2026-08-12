{
  ...
}:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.dbus.implementation = "broker";
  /*
    services.displayManager.ly = {
      enable = true;
      x11Support = true;
    };
  */

  xdg = {
    autostart.enable = true;
    icons.enable = true;
    menus.enable = true;
    sounds.enable = true;
    portal = {
      enable = true;
    };
  };

}
