#!/bin/sh -e

riverctl map normal Super B spawn 'pkill -x waybar || waybar'

waybar &
