{ pkgs, config, lib, inputs, ...}:

{
  networking.proxy.default = "http://127.0.0.1:7897/";
  networking.hostName = "Turing";
  networking.networkmanager.enable= true;
  networking.firewall.allowedTCPPorts = [ 7897 2080 22 22 23 9050 ]; 
  networking.firewall.allowedUDPPorts = [ 7897 2080 22 22 23 9050 ]; 
  networking.firewall.enable = true;
  programs.clash-verge.enable = true;

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };

  programs.firefox.enable = true;
}
