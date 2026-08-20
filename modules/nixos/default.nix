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
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  environment.systemPackages = with pkgs; [ pinentry-gnome3 pinentry-curses ];
}
