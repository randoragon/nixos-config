{ pkgs, ... }: {
  # Needed for the htpasswd utility
  environment.systemPackages = with pkgs; [ apacheHttpd ];

  services.radicale = {
    enable = true;
    settings = {
      server.hosts = [ "0.0.0.0:5232" ];
      # We will be using an nginx reverse proxy for security
      auth = {
        type = "htpasswd";
        htpasswd_filename = "/etc/radicale/users";
        htpasswd_encryption = "bcrypt";
      };
    };
  };
}
