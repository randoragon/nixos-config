{ pkgs, ... }: {
  home.packages = with pkgs; [ ironbar ];

  xdg.configFile."ironbar/config.corn" = {
    source = ./config.corn;
  };

  xdg.configFile."ironbar/style.css" = {
    source = ./style.css;
  };

  xdg.configFile."ironbar/scripts" = {
    source = ./scripts;
    executable = true;
    recursive = true;
  };
}
