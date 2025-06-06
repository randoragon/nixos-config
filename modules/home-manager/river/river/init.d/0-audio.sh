#!/bin/sh -e

mpcmap () {
    riverctl map -repeat normal "$1" "$2" spawn "mpc $3"
}

mpcmap None  XF86AudioPlay toggle
mpcmap None  XF86AudioStop stop
mpcmap None  XF86AudioPrev prev
mpcmap None  XF86AudioNext next
mpcmap Shift XF86AudioPrev 'seek -5'
mpcmap Shift XF86AudioNext 'seek +5'

mpcmap Super       P          toggle
mpcmap Super+Shift P          stop
mpcmap Super       semicolon  prev
mpcmap Super       apostrophe next
mpcmap Super+Shift semicolon  'seek -5'
mpcmap Super+Shift apostrophe 'seek +5'


pwmap () {
    riverctl map -repeat normal "$1" "$2" spawn \
        "wpctl $3 @DEFAULT_AUDIO_SINK@ $4"
}

pwmap None  XF86AudioMute        set-mute toggle
pwmap Super BackSpace            set-mute toggle
pwmap None  XF86AudioRaiseVolume set-volume 2%+
pwmap Super equal                set-volume 2%+
pwmap None  XF86AudioLowerVolume set-volume 2%-
pwmap Super minus                set-volume 2%-

riverctl map normal Super+Control P spawn "~/.scripts/choose_default_sink.sh"
