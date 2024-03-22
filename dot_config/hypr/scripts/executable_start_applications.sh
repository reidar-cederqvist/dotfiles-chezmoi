#!/bin/bash
#

waybar &
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
"$SCRIPT_DIR"/test.py
mako &
wl-paste --watch cliphist store &
hyprpaper &
pasystray &
udiskie -t &
slack -u &
ckb-next -b &
nm-applet &
nextcloud &
sleep 1
