{ lib, pkgs, config, ... }: {
  imports = [
    ../../modules/home-manager
  ];

  home.username = "pcache";
  home.homeDirectory = "/home/${config.home.username}";

  # Disable running the WM or tmux after login
  programs.bash.profileExtra = lib.mkForce "";

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
