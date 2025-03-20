{ pkgs, ... }: {
  home.packages = with pkgs; [ todoman ];
  xdg.configFile."todoman/config".source = ./config.py;
}
