{ pkgs, config, ... }: {
  home.packages = with pkgs; [ wineWow64Packages.yabridge ];

  home.sessionVariables = {
    WINEPREFIX = "${config.xdg.dataHome}/wine";
  };
}
