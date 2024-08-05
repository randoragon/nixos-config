{ config, ... }: {
  home.sessionVariables = {
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/node_repl_history";
  };
}
