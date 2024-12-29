{ pkgs, config, ... }: {
  imports = [
    ../../modules/home-manager
    ../../modules/home-manager/g-accounting.nix
    ../../modules/home-manager/g-devtools.nix
    ../../modules/home-manager/g-ebooks.nix
    ../../modules/home-manager/g-graphical.nix
    ../../modules/home-manager/g-media.nix
    ../../modules/home-manager/g-messaging.nix
    ../../modules/home-manager/g-music-library.nix
    ../../modules/home-manager/g-music-production.nix
    ../../modules/home-manager/g-notes.nix
    ../../modules/home-manager/g-password-manager.nix
    ../../modules/home-manager/g-rss.nix
    ../../modules/home-manager/g-screencasting.nix
    ../../modules/home-manager/g-synchronization.nix
    ../../modules/home-manager/nvidia
  ];

  home.username = "pcache";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    spotify
  ];

  home.sessionVariables = {
    NCMPCPP_SWITCH_WALLPAPER = "1";
    NCMPCPP_FANCY_TRANSITIONS = "1";
    NCMPCPP_KEEP_PLAYCOUNT = "1";
    NCMPCPP_KEEP_HISTORY = "1";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
