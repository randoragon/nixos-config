#!/bin/sh -e

# Lock idle session
swayidle -w \
	timeoum 600 swaylock \
	timeout 900 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
	before-sleep swaylock &

# Screen dimming
wlsunset &

# Make sure the screenshots directory exists
mkdir -p "${XDG_PICTURES_DIR}/Screenshots"

# Start wallpaper manager
(
    set +e
    swww-daemon --no-cache &
    sleep 1
    swww img -t fade ~/.config/wallpaper
) &

# Fix screen capture
# Source: https://github.com/emersion/xdg-desktop-portal-wlr/wiki/%22It-doesn't-work%22-Troubleshooting-Checklist
# Import the WAYLAND_DISPLAY env var from sway into the systemd user session.
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
# Stop any services that are running, so that they receive the new env var when they restart.
systemctl --user stop pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr
systemctl --user start wireplumber

# Run custom autostart, if present
[ -f ~/.config/autostart.sh ] && . ~/.config/autostart.sh
