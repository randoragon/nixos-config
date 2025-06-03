# The basis for all sub-configuration modules. Every system is built on top of this.
{ pkgs, ... }: {
  imports = [
    ./direnv
    ./git
    ./gnupg
    ./lazygit
    ./less
    ./lf
    ./scripts
    ./tmux
    ./wget
    ./zsh
    ./xdg-mime
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

  # Environment variables that should always be present.
  home.sessionVariables = {
    # This makes markdown previews bearable to look at, just prepend the html
    # file with it.
    HTML_MD_STYLE = ''
      <style>
      table, th, td {
          padding: 5px;
          border: 1px solid black;
          border-collapse: collapse;
      }

      body {
          font-family: 'Libertinus Serif', sans-serif;
          font-size: 14pt;
          margin: 0 auto;
          max-width: 48rem;
          line-height: 1.45;
          padding: .25rem;
      }

      code {
          font-family: 'Jetbrains Mono';
          font-size: 11pt;
      }
      </style>
    '';
  };
}
