{ config, ... }: {
  programs.khal.enable = true;
  xdg.configFile."khal/config".source = ./config;
}
