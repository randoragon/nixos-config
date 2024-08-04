{ pkgs, ... }: {
  # Use dash as /bin/sh
  environment.binsh = "${pkgs.dash}/bin/dash";

  # Set system shell to ZSH
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };

  # Enable completion for system packages
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.enableCompletion
  environment.pathsToLink = [ "/share/zsh" ];

  # System environment variables
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };
}
