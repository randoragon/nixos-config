# Config group for systems with a graphical session.
{ pkgs, ... }: {
  imports = [
    ./bemenu
    ./cursor-theme
    ./flameshot
    ./foot
    ./grim
    ./gtk
    ./krita
    ./mako
    ./sway
    ./swaylock
    ./vimiv-qt
    ./wlsunset
    ./xorg
    ./ironbar
    ./zathura
  ];

  home.packages = with pkgs; [
    swayidle
    swww
    wl-clipboard
    wlr-randr wdisplays
    brightnessctl
    ripdrag
    waypipe wayvnc wlvncc
    zenity

    firefox ungoogled-chromium
    xarchiver
    libreoffice
    android-file-transfer
    anki
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
