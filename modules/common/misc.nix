{ pkgs, ... }: {
  networking.networkmanager.enable = true;
  services.libinput.enable = true;
  services.printing.enable = true;
  services.ntp.enable = true;
  programs.ssh.startAgent = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    package = pkgs.bluez;
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gtk2;
  };
}
