{
  pkgs,
  ...
}:

{
  /*
    networking.proxy = {
      #default = "http://127.0.0.1:7897";
      noProxy = "";
    };
  */

  /*
    services.resolved.enable = true;
    # 告诉 systemd-resolved 将请求发送到你的本地 DNS 服务器
    environment.etc."systemd/resolved.conf.d/dae.conf".text = ''
      [Resolve]
      DNS=127.0.0.1
      # 可以设置后备 DNS
      FallbackDNS=1.1.1.1 8.8.8.8
      # 如果 127.0.0.1 监听在 53 端口，禁用 resolved 自己的 stub 监听器以避免冲突
      DNSStubListener=no
    '';
  */

  networking.hostName = "turing";
  networking.hostId = "8425e349";
  /*
    networking.nameservers = [
      "127.0.0.1"
    ];
  */
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      22
      23
      9050
      53
      25565
      445
      139
      9090
      993
    ];
    allowedUDPPorts = [
      22
      23
      9050
      53
      25565
      445
      139
      9090
      993
    ];
  };

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    autoStart = false;
    tunMode = true;
  };

  programs.throne.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [
        "nic"
      ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  services.mihomo = {
    enable = true;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = "/home/nic/.config/mihomo/config.yaml";
  };

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
