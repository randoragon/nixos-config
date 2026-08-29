#!/bin/sh

graphical_setup () {
    # Load necessary envs into systemd and dbus (for portals/screenshare/etc.)
    # Source #1: https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
    # Source #2: https://github.com/swaywm/sway/wiki#systemd-and-dbus-activation-environments
    if ! systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK I3SOCK XCURSOR_SIZE XCURSOR_THEME; then
        notify-send -u critical 'Failed to import envs into systemd & dbus-broker!'
        return 1
    fi

    # Stop services which rely on the portals or sway-session.target/graphical-session.target
    if ! systemctl --user stop pipewire wireplumber flameshot xdg-desktop-portal xdg-desktop-portal-wlr; then
        notify-send -u critical 'Failed to stop services relevant to xdg-desktop-portal!'
        return 1
    fi

    # Start sway-session.target and graphical-session.target
    # https://github.com/swaywm/sway/wiki/Systemd-integration#managing-user-applications-with-systemd
    if ! systemctl --user start sway-session.target; then
        notify-send -u critical 'Failed to start sway-session.target and graphical-session.target!'
        return 1
    fi

    # Start important services
    if ! systemctl --user start pipewire wireplumber flameshot xdg-desktop-portal xdg-desktop-portal-wlr; then
        notify-send -u critical 'Failed to restart services relevant to xdg-desktop-portal!'
        return 1
    fi

    # Stop sway-session.target and graphical-session.target when sway exits
    swaymsg -t subscribe '["shutdown"]' && systemctl --user stop sway-session.target &
}

# Set up the environment for a graphical session
graphical_setup || exit 1

# Lock idle session
swayidle -w \
	timeout 600 swaylock \
	timeout 900 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
	before-sleep swaylock &

# Screen dimming
wlsunset &

# Make sure the screenshots directory exists
mkdir -p "${XDG_PICTURES_DIR}/Screenshots"

# Start wallpaper manager
(
    set +e
    awww-daemon --no-cache &
    sleep 1
    awww img -t fade ~/.config/wallpaper
) &

# Run custom autostart, if present
[ -f ~/.config/autostart.sh ] && . ~/.config/autostart.sh
