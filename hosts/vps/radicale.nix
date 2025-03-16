{
  services.radicale = {
    enable = true;
    settings = {
      server.hosts = [ "0.0.0.0:5232" ];
      # We will be using an nginx reverse proxy for security
      auth.type = "none";
    };
  };
}
