{ ... }:

{

  # 2. 启用 Minecraft 服务器服务
  services.minecraft-server = {
    enable = false;
    eula = true; # 同意 Mojang EULA
    openFirewall = true; # 自动在 IPv4 和 IPv6 防火墙上开放 25565 端口

    # 3. 服务器属性（对应 server.properties）
    serverProperties = {
      server-port = 25565;
      # server-ip = "";            # 留空表示监听所有地址（包括 IPv6），默认即如此
      difficulty = 3; # 0=和平, 1=简单, 2=普通, 3=困难
      gamemode = 1; # 0=生存, 1=创造, 2=冒险, 3=旁观
      max-players = 20;
      motd = "country_of_freedom";
      white-list = false; # 设为 true 则需手动管理白名单
      # enable-rcon = true;
      # "rcon.password" = "你的密码";
    };

    # 4. JVM 内存参数（根据你的机器内存调整）
    jvmOpts = "-Xmx4096M -Xms2048M";

    # 5. （可选）使用 PaperMC 替代 Vanilla
    # package = pkgs.papermc;
  };

  # 6. 其他系统设置（如状态版本等，请按需保留）
  system.stateVersion = "26.11"; # 替换为你自己的版本

}
