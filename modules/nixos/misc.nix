{ pkgs, ... }: {
  networking.networkmanager.enable = true;
  services.libinput.enable = true;
  services.printing.enable = true;
  services.ntp.enable = true;
  services.udisks2.enable = true;
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

  # Add a group and a udev rule for kanata (https://github.com/jtroo/kanata/wiki/Avoid-using-sudo-on-Linux)
  users.extraGroups."uinput" = {};
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
}
