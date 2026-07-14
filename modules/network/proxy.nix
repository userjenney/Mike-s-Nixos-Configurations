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
      18789
      25565
      445
      139
      9090
    ];
    allowedUDPPorts = [
      22
      23
      9050
      53
      18789
      25565
      445
      139
      9090
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

}
