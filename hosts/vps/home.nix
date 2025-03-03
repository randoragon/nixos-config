{ pkgs, config, ... }: {
  imports = [
    ../../modules/home-manager
  ];

  home.username = "pcache";
  home.homeDirectory = "/home/${config.home.username}";

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
