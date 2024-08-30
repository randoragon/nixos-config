{ pkgs, ... }: {
  home.packages = with pkgs; [ newsraft ];

  xdg.configFile."newsraft/config".source = ./config;

  home.file.".scripts" = {
    source = ./scripts;
    executable = true;
    recursive = true;
  };
}
