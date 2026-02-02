{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      ChallengeResponseAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.sshd.enable = true;

  # https://nixos.wiki/wiki/Fail2Ban
  services.fail2ban.enable = true;
}
