#!/bin/bash
#

raw=$(hyprctl monitors -j)
monitors=$(echo "$raw" | jq .[].name | xargs)
monitor_list=()
for monitor in $monitors; do monitor_list+=("$monitor"); done
number_of_monitors=${#monitor_list[@]}

main_monitor=""
sec_monitor=""


echo "$monitors"
echo "$number_of_monitors"

if [ "$number_of_monitors" -eq 1 ]; then # only one monitor use it for all workspaces
	main_monitor=$monitors
	sec_monitor=$monitors
elif [ "$number_of_monitors" -eq 2 ]; then # put the main workspaces on the external monitor
	for monitor in $monitors; do
		case $monitor in
			eDP*)
				sec_monitor=$monitor
				;;
			*)
				main_monitor=$monitor
				;;
		esac
	done
else # use both the external monitors as main and second monitors
	for monitor in $monitors; do
		case $monitor in
			eDP*)
				;;
			*)
				if [ "$main_monitor" == "" ]; then
					main_monitor=$monitor
				else
					sec_monitor=$monitor
				fi
				;;
		esac
	done
fi


# find the possition of the second monitor (right-of main_monitor)

width=$(echo "$raw" | jq ".[] | select(.name==\"$main_monitor\").width")

hyprctl keyword monitor "$main_monitor", highres, 0x0, 1, bitdepth, 10
hyprctl keyword monitor "$sec_monitor", highres, "${width}"x800, 1, bitdepth, 10

for ((i=1; i <= 7; i++)); do
	cmd="$cmd keyword workspace $i, monitor:$main_monitor;"
done

for ((i=8; i <= 10; i++)); do
	cmd="$cmd keyword workspace $i, monitor:$sec_monitor;"
done

# set the workspace id to the primary workspace for that monitor if it is on an invalid workspace
main_workspace=$(hyprctl -j monitors | jq ".[] | select(.name==\"${main_monitor}\").activeWorkspace.id").
sec_workspace=$(hyprctl -j monitors | jq ".[] | select(.name==\"${sec_monitor}\").activeWorkspace.id").

if [ "$main_workspace" -lt 1 ] || [ "$main_workspace" -gt 7 ]; then
	hyprctl dispatch workspace 1
fi

if [ "$sec_workspace" -lt 8 ] || [ "$sec_workspace" -gt 10 ]; then
	hyprctl dispatch workspace 8
fi

hyprctl --batch "$cmd"
