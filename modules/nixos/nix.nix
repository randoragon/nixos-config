{
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow instaling non-free packages
  nixpkgs.config.allowUnfree = true;

  # Clean up and optimize the store automatically
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
}
