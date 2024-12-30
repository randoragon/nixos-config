#!/bin/sh
# Disable carla quit confirmation dialog and configure paths.

set -e

CONFIG_FILE="$XDG_CONFIG_HOME/falkTX/Carla2.conf"

mkdir -p -- "$(dirname -- "$CONFIG_FILE")"

if [ ! -f "$CONFIG_FILE" ]; then
    cat >"$CONFIG_FILE" <<EOF
[Main]
ConfirmExit=false

[Paths]
EOF
    for v in DSSI LADSPA LV2 SF2 SFZ VST2 VST3 JSFX; do
        paths="$(printenv "${v}_PATH")" || true
        if [ -n "$paths" ]; then
            printf '%s=' "$v"
            echo "$paths" | sed 's/:/, /g'
        fi
    done >>"$CONFIG_FILE"
fi
