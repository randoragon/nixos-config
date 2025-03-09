{
  services.nginx = {
    enable = true;
    virtualHosts."randoragon.dev" = {
      enableACME = true;
      forceSSL = true;
      root = "/srv/www/randoragon.dev";
    };

    virtualHosts."pcache.dev" = {
      enableACME = true;
      forceSSL = true;
      root = "/srv/www/pcache.dev";
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "pcache01@gmail.com";
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };
}
