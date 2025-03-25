#!/bin/sh

mkdir -p -- "$GRIM_DEFAULT_DIR"

riverctl map normal None Print spawn 'flameshot gui'
riverctl map normal Control Print spawn 'grim'
