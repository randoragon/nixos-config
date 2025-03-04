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

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
  };
  environment.systemPackages = with pkgs; [ pinentry-gtk2 pinentry-curses ];

  # Enable i2c support and group, for ddcutil and ddui
  hardware.i2c.enable = true;
}
