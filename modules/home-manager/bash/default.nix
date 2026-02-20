{ pkgs, config, lib, ... }: {
  programs.bash = {
    enable = true;
    enableVteIntegration = true;

    historyFile = "${config.xdg.cacheHome}/bash/history";
    historyFileSize = 10000;
    historyControl = [ "ignoredups" ];

    initExtra = builtins.readFile ./bashrc;
    profileExtra = builtins.readFile ./login-extra.sh;
  };

  # Configure readline, which bash is based on
  xdg.configFile."inputrc".text = ''
    # Show block or pipe depending on input mode
    set show-mode-in-prompt on
    set vi-cmd-mode-string "\1\e[2 q\2"
    set vi-ins-mode-string "\1\e[6 q\2"

    # Better completion
    set colored-completion-prefix on
    set colored-stats on
    set bell-style none
    set mark-directories on
    set show-all-if-ambiguous on
    set show-all-if-unmodified on
    set menu-complete-display-prefix on
  '';
  home.sessionVariables.INPUTRC = "${config.xdg.configHome}/inputrc";

  xdg.configFile."jumprc".source = ./jumprc;
  xdg.configFile."aliasrc".source = ./aliasrc;
}
