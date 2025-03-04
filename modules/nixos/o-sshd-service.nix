{ lib, ... }: {
  # Create the SSH services, but do not enable them. This does not install ssh
  # or sshd, they are available without these lines. But it does create systemd
  # services like sshd.service that make it easy to start an SSH server.
  # https://www.reddit.com/r/NixOS/comments/16mbn41/install_but_dont_enable_openssh_sshd_service/
  services.openssh.enable = true;
  systemd.services.sshd.wantedBy = lib.mkForce [ ];
}
