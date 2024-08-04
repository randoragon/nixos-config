# Start graphical server on tty1 if not already running, otherwise start tmux
if [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_CURRENT_DESKTOP=river  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
    river
elif command -v tmux; then
    tmux
fi
