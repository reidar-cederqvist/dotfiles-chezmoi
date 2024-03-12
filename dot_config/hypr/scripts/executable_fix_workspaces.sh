#!/bin/bash
#

find_monitor(){
	monitor=$(hyprctl -j monitors | jq ".[] | select(.serial == \"$1\").name" | xargs)
	if [ -z "$monitor" ]; then
		echo "$1"
	else 
		echo "$monitor"
	fi
}

if [ $# -ne 2 ]; then 
	echo -e "Usage:
\t$0 <Main monitor> <Second monitor>"
	exit 99
fi

main_monitor=$(find_monitor "$1")
sec_monitor=$(find_monitor "$2")

active_window=$(hyprctl -j activewindow | jq .address | xargs)

for ((i=10; i >= 8; i--)); do
	cmd="${cmd} dispatch workspace $i;"
	cmd="${cmd} dispatch movecurrentworkspacetomonitor $sec_monitor;"
	cmd="${cmd} dispatch workspace $i;"
	cmd="${cmd} keyword workspace $i, monitor:$sec_monitor;"
done

for ((i=7; i >= 1; i--)); do
	cmd="${cmd} dispatch workspace $i;"
	cmd="${cmd} dispatch movecurrentworkspacetomonitor $main_monitor;"
	cmd="${cmd} dispatch workspace $i;"
	cmd="${cmd} keyword workspace $i, monitor:$main_monitor;"
done

cmd="${cmd} dispatch focuswindow address:$active_window"

echo hyprctl --batch "$cmd"
hyprctl --batch "$cmd"
