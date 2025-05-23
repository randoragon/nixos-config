{ pkgs, spkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./neovim.nix
    ./ssh.nix
    ./git-server.nix
    ./nginx.nix
    ./radicale.nix
    ../../modules/nixos
  ];

  # Set hostname
  networking.hostName = "vps";

  # Enable btrfs scrubbing
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
  };

  # User configuration
  users.users.pcache = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [ ../authorized_keys ];
  };

  home-manager = {
    extraSpecialArgs = { inherit spkgs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      "pcache" = import ./home.nix;
    };
  };

  # Automatically install updates and reboot if needed
  system.autoUpgrade = {
    enable = true;
    flake = "github:randoragon/nixos-config";
    allowReboot = true;
    dates = "04:20";
    rebootWindow = {
      lower = "03:00";
      upper = "05:00";
    };
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11";
}
