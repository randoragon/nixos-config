{ pkgs, ... }: {
  # Doesn't work on Wayland - https://github.com/NixOS/nixpkgs/issues/169143
  services.gammastep.enable = false;

  home.packages = with pkgs; [ gammastep ];
  xdg.configFile."gammastep/config.ini".source = ./config.ini;
}
