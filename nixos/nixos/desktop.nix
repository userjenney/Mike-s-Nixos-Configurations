{ pkgs, ...}:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.xfce.enable = false;
  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = true;
  services.gnome.games.enable = true;
  services.gnome.core-developer-tools.enable = true;
}
