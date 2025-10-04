{ pkgs, ... }: {
  home.packages = with pkgs; [ beets ];

  xdg.configFile."beets/config.yaml".source = ./config.yaml;
}
