{ lib, pkgs, ... }: {
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

  # Create the SSH services, but do not enable them. This does not install ssh
  # or sshd, they are available without these lines. But it does create systemd
  # services like sshd.service that make it easy to start an SSH server.
  # https://www.reddit.com/r/NixOS/comments/16mbn41/install_but_dont_enable_openssh_sshd_service/
  services.openssh.enable = true;
  systemd.services.sshd.wantedBy = lib.mkForce [ ];

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
