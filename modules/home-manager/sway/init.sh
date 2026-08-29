#!/bin/sh -e

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

# Load necessary envs into systemd and dbus (for portals/screenshare/etc.)
# Source #1: https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
# Source #2: https://github.com/swaywm/sway/wiki#systemd-and-dbus-activation-environments
systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP SWAYSOCK I3SOCK XCURSOR_SIZE XCURSOR_THEME
# Stop any services that are running, so that they receive the new env var when they restart.
systemctl --user stop pipewire wireplumber flameshot xdg-desktop-portal xdg-desktop-portal-wlr
systemctl --user start wireplumber flameshot

# Run custom autostart, if present
[ -f ~/.config/autostart.sh ] && . ~/.config/autostart.sh
