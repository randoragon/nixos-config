#!/bin/sh

# This script is executed by the hotkey daemon when button4 is pressed on a wacom tablet device.

# Icon used for notifications
icon="/usr/share/icons/Adwaita/96x96/devices/input-tablet-symbolic.symbolic.png" 

if ! xkeycheck lsuper; then
    xdotool keyup super
    xdotool keydown super
    notif_id="$(notify-send -i "$icon" -p -u low -t 0 "Wacom Intuos S" "Super Mode <b>ON</b>")"
else
    xdotool keyup super
    notify-send -C "$notif_id"
fi
