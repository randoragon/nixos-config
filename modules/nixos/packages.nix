{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    dejavu_fonts
    texlivePackages.opensans
    font-awesome
    ipafont
    liberation_ttf
    carlito
    libertinus
    unifont
  ];

  environment.systemPackages = with pkgs; [
    bash dash
    firefox ungoogled-chromium
    zathura
    thunderbird
    sxiv oculante mpv
    xarchiver
    lf tmux tree jq ripgrep fzf
    curl wget htop file
    gnupg pinentry-curses pinentry-gtk2
    iputils wpa_supplicant nettools wirelesstools
    qpwgraph pulsemixer
    dosfstools
    inxi pciutils neofetch
    zip unzip p7zip rar
    bc libqalculate
    rsync
    trash-cli
    imagemagick graphicsmagick
    ffmpeg sox
    lm_sensors
    zenity
  ];

  # River should ideally be installed at the user-level.
  # However, I encountered NVIDIA-related crashes when removing this
  # system-wide enable. I assume this does something Home Manager's enabling
  # option doesn't, which is why I'm keeping it.
  programs.river = {
    enable = true;
    extraPackages = [];  # Don't use this; decide at the user-level
  };
}
