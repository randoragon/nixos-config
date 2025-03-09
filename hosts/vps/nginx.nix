{
  services.nginx = let
    reverse-proxy-config = {
      enableACME = true;
      forceSSL = true;
      locations."/".proxyPass = "https://localhost:5232";
    }; in {
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

    # Reverse proxy for caldav and carddav
    virtualHosts."caldav.pcache.dev" = reverse-proxy-config;
    virtualHosts."carddav.pcache.dev" = reverse-proxy-config;
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
