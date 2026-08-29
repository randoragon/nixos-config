# Ensure VIM_PREVIEW_HOME exists
mkdir -p -- "$VIM_PREVIEW_HOME"

# Some programs, notably SVN, need this to access the gpg-agent socket
GPG_AGENT_INFO="$(gpgconf --list-dirs agent-socket | tr -d '\n' && echo -n ::)"
export GPG_AGENT_INFO

# Start graphical server on tty1 if not already running, otherwise start tmux
if [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_CURRENT_DESKTOP=sway  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
    export XDG_SESSION_DESKTOP=sway  # https://github.com/flameshot-org/flameshot/blob/master/docs/UsageHyprlandSwayWlroots.md#basic-steps
    export _JAVA_AWT_WM_NONREPARENTING=1
    export SDL_VIDEODRIVER=wayland

    # This helped resolve issues with OBS, Flameshot and Pinta on Sway + NVIDIA 580
    # https://forum.endeavouros.com/t/sway-with-nvidia-tutorial/23733/2
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export GDK_BACKEND=wayland

    exec sway --unsupported-gpu
fi

# Tell (Neo)Vim to use a tty-suitable colorscheme. This is my own convention.
case "$(tty)" in
    /dev/tty*) export VIM_TTY_COLORSCHEME=1 ;;
esac

# Start tmux, if available and not already inside tmux
if command -v tmux && [ -z "$TMUX" ]; then
    tmux
fi
