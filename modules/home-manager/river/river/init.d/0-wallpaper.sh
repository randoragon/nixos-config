#!/bin/sh -e

awww-daemon --format xrgb --no-cache &

riverctl map normal Super+Control+Shift Slash spawn 'awww clear 111111'
riverctl map normal Super+Control Slash spawn '~/.scripts/wallpaper_random.sh'

awww img -t none ~/.config/wallpaper
