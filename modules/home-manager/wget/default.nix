{ config, ... }: {
  xdg.configFile."wgetrc".text = "hsts-file=${config.xdg.cacheHome}/wget-hsts";
}
