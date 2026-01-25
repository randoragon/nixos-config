# Ensure VIM_PREVIEW_HOME exists
mkdir -p -- "$VIM_PREVIEW_HOME"

# Start graphical server on tty1 if not already running, otherwise start tmux
if [ "$(tty)" = "/dev/tty1" ]; then
    export XDG_CURRENT_DESKTOP=sway  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
    export _JAVA_AWT_WM_NONREPARENTING=1

    # This helped resolve issues with OBS, Flameshot and Pinta on Sway + NVIDIA 580
    # https://forum.endeavouros.com/t/sway-with-nvidia-tutorial/23733/2
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
    export QT_QPA_PLATFORM=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export GDK_BACKEND=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia

    exec sway --unsupported-gpu
elif command -v tmux; then
    export VIM_TTY_COLORSCHEME=1  # Tell (Neo)Vim to use a tty-suitable colorscheme. This is my own convention.
    tmux
fi
