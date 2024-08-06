{ config, ... }: {
  services.mpd = rec {
    enable = true;
    dbFile = null;  # Conflicts with the "database {}" construct that I use inside mpd.conf
    extraConfig = builtins.readFile ./mpd.conf;
  };

  home.sessionVariables = {
    # Note: for ncmpcpp to work, MPD_HOST must begin with "/" if it points to a socket.
    MPD_HOST = "${config.xdg.dataHome}/mpd/socket";
    MPD_PORT = "6601";
  };

  services.mpd-discord-rpc = {
    enable = true;
    settings = {
      id = 677226551607033903;
      hosts = [ "localhost:6601" ];
      format = {
        details = "$title";
        state = "$artist / $album";
        timestamp = "elapsed";
        large_image = "notes";
        small_image = "";
        large_text = "";
        small_text = "";
      };
    };
  };
}
