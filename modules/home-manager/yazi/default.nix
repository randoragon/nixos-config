{ yazi-plugins, ... }: {
  programs.yazi = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
    shellWrapperName = "yazicd";

    initLua = ./init.lua;
    settings = builtins.fromTOML (builtins.readFile ./yazi.toml);
    theme = builtins.fromTOML (builtins.readFile ./theme.toml);
    keymap = builtins.fromTOML (builtins.readFile ./keymap.toml);
    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      mount = "${yazi-plugins}/mount.yazi";
      piper = "${yazi-plugins}/piper.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      types = "${yazi-plugins}/types.yazi";
    };
  };
}
