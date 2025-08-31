{
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
      bookmarks = ./plugins/bookmarks.yazi;
      chmod = ./plugins/chmod.yazi;
      mount = ./plugins/mount.yazi;
      piper = ./plugins/piper.yazi;
      toggle-pane = ./plugins/toggle-pane.yazi;
      types = ./plugins/types.yazi;
    };
  };
}
