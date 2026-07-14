{ ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.dbus.implementation = "broker";

  /*
    xdg = {
      autostart.enable = true;
      icons.enable = true;
      menus.enable = true;
      portal.enable = true;
      sounds.enable = true;
    };
  */

  services.samba = {
    enable = true;
    openFirewall = true; # 自动开放 139、445 端口

    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "security" = "user"; # 要求用户认证
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };

      # 共享目录定义（名为 videos）
      videos = {
        "path" = "/home/nic/Videos"; # 替换为你的实际视频目录
        "browseable" = "yes";
        "read only" = "no"; # 只读，如果你需要写入可改为 no
        "valid users" = "nic"; # 只允许用户 nic 访问
        "force user" = "nic"; # 所有操作以 nic 身份执行
      };
    };
  };

}
