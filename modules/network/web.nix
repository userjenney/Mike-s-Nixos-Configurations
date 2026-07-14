{
  ...
}:

{

  services.httpd = {
    enable = true;
    adminAddr = "mike0874@duck.com";
    virtualHosts."localhost" = {
      documentRoot = "/var/www/html";
    };
  };

}
