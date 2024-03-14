#!/bin/bash
#

waybar &

sleep 1
mako &
wl-paste --watch cliphist store &
hyprpaper &
pasystray &
udiskie -t &
slack -u &
ckb-next -b &
nm-applet &
nextcloud &
