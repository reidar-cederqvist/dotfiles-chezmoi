#!/bin/bash
#

waybar &

while ! pidof waybar; do
	echo not runnning
done

mako &
wl-paste --watch cliphist store &
hyprpaper &
pasystray &
udiskie -t &
slack -u &
ckb-next -b &
nm-applet &
nextcloud &
