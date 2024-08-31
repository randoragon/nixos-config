{ pkgs, config, ... }: {
  home.packages = with pkgs; [ wine ];

  home.sessionVariables = {
    WINEPREFIX = "${config.xdg.dataHome}/wine";
  };
}
