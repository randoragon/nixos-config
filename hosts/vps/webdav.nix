{ config, pkgs, ... }: {
  services.radicale = {
    enable = true;
    settings = {
      server.hosts = [ "0.0.0.0:5232" ];
      # We will be using an nginx reverse proxy for security
      auth.type = "none";
    };
  };

  environment.systemPackages = with pkgs; [ vdirsyncer ];
  services.vdirsyncer = {
    enable = true;
    jobs."my_contacts" = {
      enable = true;
      config.storages = {
        my_contacts_local = {
          type = "filesystem";
          path = "~/.local/share/contacts";
          fileext = ".vcf";
        };
        my_contacts_remote = {
          type = "carddav";
          url = "https://127.0.0.1";
          # This does not matter, because the server accepts any login.
          # Authentication is delegated to the nginx reverse proxy.
          username = "user";
          password = "pass";
        };
        my_calendar_local = {
          type = "filesystem";
          path = "~/.local/share/calendar";
          fileext = ".vcf";
        };
        my_calendar_remote = {
          type = "caldav";
          url = "https://127.0.0.1";
          # This does not matter, because the server accepts any login.
          # Authentication is delegated to the nginx reverse proxy.
          username = "user";
          password = "pass";
        };
      };

      config.pairs = {
        my_contacts = {
          a = "my_contacts_local";
          b = "my_contacts_remote";
          collections = [ "from a" "from b" ];
        };
        my_calendar = {
          a = "my_calendar_local";
          b = "my_calendar_remote";
          collections = [ "from a" "from b" ];
        };
      };
    };
  };
}
