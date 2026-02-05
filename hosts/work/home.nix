{ lib, pkgs, config, ... }: {
  imports = [
    ./git.nix
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

  # Configure sway outputs
  xdg.configFile."sway/outputs".text = ''
    # vim: ft=swayconfig
    output "AU Optronics 0x63ED Unknown" pos 0 0
    output "HP Inc. HP Z27q G3 CN44092NF0" pos 1920 0
    output "HP Inc. HP Z27q G3 CN44092NFQ" pos 4480 0
    bindsym $mod+F12 --release output "AU Optronics 0x63ED Unknown" toggle
  '';

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
