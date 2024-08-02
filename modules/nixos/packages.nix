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
    udisks
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
  ];

  programs.river = {
    enable = true;
    extraPackages = with pkgs; [
      rivercarro
      foot
      swayidle
      waylock
      swww
      yambar
      bemenu
      libnotify mako
      grim slurp swappy
      wl-clipboard wlr-randr
    ];
  };
}
