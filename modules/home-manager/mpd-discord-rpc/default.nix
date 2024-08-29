{ pkgs, ... }: {
  home.packages = with pkgs; [ mpd-discord-rpc ];

  xdg.configFile."discord-rpc/config.toml".source = ./config.toml;
}
