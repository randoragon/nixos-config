# Config group for systems with a graphical session.
{ pkgs, ... }: {
  imports = [
    ./bemenu
    ./carla
    ./cursor-theme
    ./flameshot
    ./foot
    ./grim
    ./gtk
    ./krita
    ./mako
    ./niri
    ./swaylock
    ./vimiv-qt
    ./wlsunset
    ./xorg
    ./waybar
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
    xwayland-satellite
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
