# The basis for all sub-configuration modules. Every system is built on top of this.
{ pkgs, ... }: {
  imports = [
    ./direnv
    ./git
    ./gnupg
    ./lazygit
    ./less
    ./lf
    ./nvim
    ./scripts
    ./tmux
    ./wget
    ./zsh
  ];

  # User packages that should always be installed.
  home.packages = with pkgs; [
    bash dash
    curl wget
    zip unzip p7zip
    jq bc libqalculate
    rsync
    file patch highlight
    tmux
    tree ripgrep fzf
    htop lm_sensors
    neofetch
    gdu
  ];
}
