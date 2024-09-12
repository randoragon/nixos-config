# Config group for systems with a graphical session.
{ pkgs, ... }: {
  imports = [
    ./bemenu
    ./carla
    ./cursor-theme
    ./foot
    ./grim
    ./gtk
    ./krita
    ./mako
    ./river
    ./swappy
    ./sxiv
    ./wlsunset
    ./xorg
    ./yambar
    ./zathura
  ];

  home.packages = with pkgs; [
    swayidle waylock
    swww
    grim slurp swappy
    wl-clipboard
    wlr-randr wdisplays
    brightnessctl
    ripdrag
    zenity

    firefox ungoogled-chromium
    zathura
    oculante mpv
    xarchiver
    olive-editor
    pinta
    libreoffice
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
  };
}
