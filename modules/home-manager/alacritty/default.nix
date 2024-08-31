{ pkgs, ... }: {
  home.packages = with pkgs; [ alacritty ];

  home.file.".local/bin/alacritty" = {
    source = ./alacritty;
    executable = true;
  };
}
