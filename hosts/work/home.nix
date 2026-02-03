{ lib, pkgs, config, ... }: {
  imports = [
    ./svn.nix
    ../../modules/home-manager
    ../../modules/home-manager/g-daily-driver.nix
    ../../modules/home-manager/g-devtools.nix
    ../../modules/home-manager/g-graphical.nix
    ../../modules/home-manager/sway
  ];

  home.username = "piotrkas";
  home.homeDirectory = "/home/${config.home.username}";

  # Keep authentication cache indefinitely
  services.gpg-agent = lib.mkForce {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
