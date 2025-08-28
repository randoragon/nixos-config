{ pkgs, config, ... }: {
  home.packages = with pkgs; [ wineWowPackages.yabridge ];

  home.sessionVariables = {
    WINEPREFIX = "${config.xdg.dataHome}/wine";
  };
}
