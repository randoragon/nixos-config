{ pkgs, ... }: {
  home.packages = with pkgs; [ niri xwayland-satellite ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."niri/init.sh".source = ./init.sh;
}
