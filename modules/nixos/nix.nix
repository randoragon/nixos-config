{ pkgs, ... }: {

  nix.settings = {
    # Enable flakes
    experimental-features = [ "nix-command" "flakes" ];

    # Optimize the store automatically
    auto-optimise-store = true;

    # Authorize these users to add stuff to substituters (this is equivalent to
    # having root access due to the ability to swap binary caches).
    trusted-users = [ "pcache" ];

    # Set up binary caches
    substituters = [
      "https://cache.nixos.org"
      "https://pcache.cachix.org"
    ];
    trusted-public-keys = [
      # The public key of cache.nixos.org is built-in
      "pcache.cachix.org-1:bvgSb3beNZ7Q0DTg8VqI47Dbi6Ok4VJWxmypa4KLmO4="
    ];
  };

  # Allow instaling non-free packages
  nixpkgs.config.allowUnfree = true;


  # Enable nh and auto-cleaning
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 7w";
    };
  };

  # Configure nix-index-database
  programs.nix-index = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = false;
  };

  # Install cachix CLI tool
  environment.systemPackages = with pkgs; [ cachix ];
}
