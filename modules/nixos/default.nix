{ pkgs, ... }: {
  imports = [
    ./boot.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./shell.nix
    ./sudo.nix
  ];

  networking.networkmanager.enable = true;
  programs.ssh.startAgent = true;
  services.ntp.enable = true;

  # https://github.com/nix-community/nix-ld
  programs.nix-ld.enable = true;

  # Make sure CNF integration with nix-index is disabled
  programs.command-not-found.enable = false;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
  };
  environment.systemPackages = with pkgs; [ pinentry-gtk2 pinentry-curses ];
}
