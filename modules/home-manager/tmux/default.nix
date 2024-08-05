{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    historyLimit = 10000;
    keyMode = "vi";
    prefix = "C-a";
    terminal = "screen-256color";

    extraConfig = ''
      # Automatically set window title
      set-window-option -g automatic-rename on
      set-option -g set-titles on

      # Use n and p to switch windows
      bind-key n next-window
      bind-key p previous-window

      # THEME
      set -g status-bg black
      set -g status-fg white
      set -g status-interval 1
      set -g status-left-length 30
      set -g status-left '#[fg=cyan](#S) #[fg=yellow]#(whoami)#[fg=green]@#[fg=brightblue]#(hostname) '
      set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M:%S#[default] #[fg=yellow]#(~/.local/bin/pow)#[default]'
      set -g window-style 'fg=white,bg=black'
    '';
  };
}
