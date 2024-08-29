{ config, pkgs, ... }: {
  home.packages = with pkgs; [ mpd ];

  xdg.configFile."mpd/mpd.conf".source = ./mpd.conf;
  home.sessionVariables = {
    # Note: for ncmpcpp to work, MPD_HOST must begin with "/" if it points to a socket.
    MPD_HOST = "${config.xdg.dataHome}/mpd/socket";
    MPD_PORT = "6601";
  };
}
