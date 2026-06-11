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
    focusEvents = true;
    mouse = true;

    extraConfig = ''
      # Automatically set window title
      set-window-option -g automatic-rename on
      set-option -g set-titles on

      # use Alt-Shift-vim keys without prefix key for basic actions
      bind-key -n M-C new-window
      bind-key -n M-H select-pane -L
      bind-key -n M-J select-pane -D
      bind-key -n M-K select-pane -U
      bind-key -n M-L select-pane -R
      bind-key -n M-N next-window
      bind-key -n M-P previous-window
      bind-key -n M-% split-window -h
      bind-key -n M-\" split-window -v
      bind-key -n M-\{ swap-window -d -t -1
      bind-key -n M-\} swap-window -d -t +1

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
