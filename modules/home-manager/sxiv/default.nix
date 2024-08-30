{ pkgs, ... }: {
  home.packages = with pkgs; [ sxiv ];

  xdg.configFile."sxiv/exec" = {
    source = ./exec;
    executable = true;
    recursive = true;
  };
}
