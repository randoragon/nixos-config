{ pkgs, ... }: {
  home.packages = with pkgs; [ libnotify ];

  services.mako = {
    enable = true;
    extraConfig = builtins.readFile ./config;
  };
}
