{ config, ... }: {
  home.sessionVariables = {
    WGETRC = "${config.xdg.configHome}/wgetrc";
  };

  xdg.configFile."wgetrc".text = "hsts-file=${config.xdg.cacheHome}/wget-hsts";
}
