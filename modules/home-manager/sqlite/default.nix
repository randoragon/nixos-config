{ config, ... }: {
  home.sessionVariables = {
    SQLITE_HISTORY = "${config.xdg.dataHome}/sqlite/history";
  };
}
