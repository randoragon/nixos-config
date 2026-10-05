{ lib, config, pkgs, ... }: {
  home.packages = with pkgs; [ mpd ];

  xdg.configFile."mpd/mpd.conf".source = ./mpd.conf;
  home.sessionVariables = {
    # Note: for ncmpcpp to work, MPD_HOST must begin with "/" if it points to a socket.
    MPD_HOST = "${config.xdg.dataHome}/mpd/socket";
    MPD_PORT = "6601";
  };

  # Create the socket directory, because without it MPD cannot start
  home.activation = {
    mpdDirs = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run mkdir -p -- "$(dirname -- "$MPD_HOST")"
    '';
  };
}
