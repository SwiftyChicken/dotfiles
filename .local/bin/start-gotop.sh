#!/bin/bash

pgrep gotop && xdotool search --name "gotop" windowactivate && exit 0|| alacritty -t gotop --class top,gotop -e gotop &

sleep 0.5

pid="$(xprop -root _NET_ACTIVE_WINDOW| rev | cut -d' ' -f1 | rev | xargs -I{} xprop -id {} _NET_WM_PID)"

focus_pid="$(xprop -root _NET_ACTIVE_WINDOW| rev | cut -d' ' -f1 | rev | xargs -I{} xprop -id {} _NET_WM_PID)"


while [[ "$focus_pid" == "$pid" ]]; do
	sleep 0.3
	focus_pid="$(xprop -root _NET_ACTIVE_WINDOW| rev | cut -d' ' -f1 | rev | xargs -I{} xprop -id {} _NET_WM_PID)"
done

wmctrl -x -c gotop

