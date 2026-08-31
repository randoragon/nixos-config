# Config group for systems with a graphical session.
{ pkgs, ... }: {
  imports = [
    ./bemenu
    ./cursor-theme
    ./flameshot
    ./foot
    ./grim
    ./gtk
    ./ironbar
    ./krita
    ./mako
    ./sway
    ./swaylock
    ./vimiv-qt
    ./wlsunset
    ./xorg
    ./zathura
  ];

  home.packages = with pkgs; [
    swayidle
    awww
    wl-clipboard
    wlr-randr wdisplays
    brightnessctl
    ripdrag
    waypipe wayvnc wlvncc wprs
    zenity

    firefox ungoogled-chromium
    xarchiver
    libreoffice
    android-file-transfer
    anki
    aseprite
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
