{
  programs.yazi = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
    shellWrapperName = "yazicd";

    settings = builtins.fromTOML (builtins.readFile ./yazi.toml);
    theme = builtins.fromTOML (builtins.readFile ./theme.toml);
    keymap = builtins.fromTOML (builtins.readFile ./keymap.toml);
  };
}
