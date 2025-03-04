# Miscellaneous configuration that is common on daily-driver computers.
# This exists to be easily excludable from VPS servers and such.
{ pkgs, ... }: {
  imports = [
    ./bluetuith
    ./kanata
    ./sqlite
    ./wine
    ./xdg-dirs
  ];

  home.packages = with pkgs; [
    iputils wpa_supplicant nettools wirelesstools
    binutils pciutils dosfstools usbutils
    rar
    trash-cli
    tokei
    inxi
    figlet sl asciiquarium
  ];
}
