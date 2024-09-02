# The basis for all sub-configuration modules. Every system is built on top of this.
{ pkgs, ... }: {
  imports = [
    ./direnv
    ./git
    ./gnupg
    ./kanata
    ./lazygit
    ./less
    ./lf
    ./nvim
    ./scripts
    ./sqlite
    ./tmux
    ./wget
    ./wine
    ./xdg-dirs
    ./xdg-mime
    ./zsh
  ];

  # User packages that should always be installed.
  home.packages = with pkgs; [
    bash dash
    iputils wpa_supplicant nettools wirelesstools
    curl wget
    binutils pciutils dosfstools
    zip unzip p7zip rar
    jq bc libqalculate
    rsync
    file patch highlight
    tmux
    lf tree ripgrep fzf
    htop lm_sensors
    trash-cli
    tokei
    inxi neofetch
    figlet sl asciiquarium
  ];
}
