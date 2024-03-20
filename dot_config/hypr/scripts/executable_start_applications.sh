#!/bin/bash
#

waybar &

$HOME/test.py
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
