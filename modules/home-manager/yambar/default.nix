{
  programs.yambar = {
    enable = true;
    settings = import ./config.nix;
  };

  home.file.".scripts/yambar" = {
    source = ./scripts;
    executable = true;
    recursive = true;
  };
}
