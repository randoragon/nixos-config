# Config group for systems with a graphical session.
{ pkgs, ... }: {
  imports = [
    ./bemenu
    ./carla
    ./cursor-theme
    ./foot
    ./gammastep
    ./grim
    ./gtk
    ./krita
    ./mako
    ./river
    ./swappy
    ./sxiv
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
  ];

  home.sessionVariables = {
    BROWSER = "firefox";
  };
}