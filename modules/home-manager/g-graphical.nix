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
    ./nsxiv
    ./wlsunset
    ./xorg
    ./xwayland-satellite
    ./yambar
    ./zathura
  ];

  home.packages = with pkgs; [
    swayidle swaylock
    swww
    wl-clipboard
    wlr-randr wdisplays
    brightnessctl
    ripdrag
    zenity

    firefox ungoogled-chromium
    zathura
    xarchiver
    libreoffice
    android-file-transfer
    anki
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
