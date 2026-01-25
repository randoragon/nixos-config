{ lib, pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = null;
  };
  xdg.configFile."sway/config".source = lib.mkForce ./config;
  xdg.configFile."sway/init.sh".source = ./init.sh;
}
