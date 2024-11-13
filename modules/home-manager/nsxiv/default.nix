{ pkgs, ... }: {
  home.packages = with pkgs; [ nsxiv ];

  xdg.configFile."nsxiv/exec" = {
    source = ./exec;
    executable = true;
    recursive = true;
  };
}
