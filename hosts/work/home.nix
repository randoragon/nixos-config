{ pkgs, config, ... }: {
  imports = [
    ../../modules/home-manager
    ../../modules/home-manager/g-daily-driver.nix
    ../../modules/home-manager/g-devtools.nix
    ../../modules/home-manager/g-graphical.nix
    ../../modules/home-manager/sway
  ];

  home.username = "piotrkas";
  home.homeDirectory = "/home/${config.home.username}";

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
