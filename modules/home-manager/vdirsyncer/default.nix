{ config, pkgs, ... }: {
  home.packages = with pkgs; [vdirsyncer];
  xdg.configFile."vdirsyncer/config".source = ./config;
}
