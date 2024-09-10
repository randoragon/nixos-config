{
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow instaling non-free packages
  nixpkgs.config.allowUnfree = true;

  # Optimize the store automatically
  nix.settings.auto-optimise-store = true;

  # Enable nh and auto-cleaning
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 7w";
    };
  };
}
