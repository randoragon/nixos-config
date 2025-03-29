# Ensure VIM_PREVIEW_HOME exists
mkdir -p -- "$VIM_PREVIEW_HOME"

# Start graphical server on tty1 if not already running, otherwise start tmux
if [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_CURRENT_DESKTOP=niri  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
    niri-session -l
elif command -v tmux; then
    export VIM_TTY_COLORSCHEME=1  # Tell (Neo)Vim to use a tty-suitable colorscheme. This is my own convention.
    tmux
fi
