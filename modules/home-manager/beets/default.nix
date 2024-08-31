{ pkgs, ... }: {
  home.packages = with pkgs; [ beets-unstable ];

  xdg.configFile."beets/config.yaml".source = ./config.yaml;
}
