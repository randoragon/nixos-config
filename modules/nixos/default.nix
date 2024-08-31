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
  services.libinput.enable = true;
  services.udisks2.enable = true;
  programs.ssh.startAgent = true;
  services.ntp.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
  };
  environment.systemPackages = with pkgs; [ pinentry-gtk2 pinentry-curses ];

  # Add a group and a udev rule for kanata (https://github.com/jtroo/kanata/wiki/Avoid-using-sudo-on-Linux)
  users.extraGroups."uinput" = {};
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
}
