{ pkgs, ... }: {
  # Use dash as /bin/sh
  environment.binsh = "${pkgs.dash}/bin/dash";

  # Set system shell to ZSH
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };
}
