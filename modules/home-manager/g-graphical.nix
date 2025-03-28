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
    ./nsxiv
    ./river
    ./wlsunset
    ./xorg
    ./yambar
    ./zathura
  ];

  home.packages = with pkgs; [
    swayidle waylock
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
