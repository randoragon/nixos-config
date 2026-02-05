{ lib, pkgs, spkgs, secrets, ... }: {

  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./ssh.nix
    ../../modules/nixos
    ../../modules/nixos/o-audio.nix
    ../../modules/nixos/o-bluetooth.nix
    ../../modules/nixos/o-graphical.nix
    ../../modules/nixos/o-kanata.nix
    ../../modules/nixos/o-removable-storage.nix
    # ../../modules/nixos/o-printing.nix
    ../../modules/nixos/o-work.nix
  ];

  # Set hostname
  networking.hostName = "pknix";

  # User configuration
  users.users.piotrkas = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" "uinput" "docker" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [ ../authorized_keys_p ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit spkgs;
      inherit secrets;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      "piotrkas" = import ./home.nix;
    };
  };

  # Extra work stuff
  programs.gnupg.agent.pinentryPackage = lib.mkForce pkgs.pinentry-curses;
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    poppler-utils
    python3
  ];

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
  system.stateVersion = "24.05";
}
