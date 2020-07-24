#!/bin/sh

lid=$(cat /tmp/lfID);\
wmctrl -ir $lid -b toggle,hidden && wmctrl -ia $lid
pid=$(xprop -id $lid _NET_WM_PID)

focus_pid=$(xprop -root _NET_ACTIVE_WINDOW| rev | cut -d' ' -f1 | rev | xargs -I{} xprop -id {} _NET_WM_PID)
while [[ "$focus_pid" == "$pid" ]]; do
	sleep 1
	focus_pid=$(xprop -root _NET_ACTIVE_WINDOW| rev | cut -d' ' -f1 | rev | xargs -I{} xprop -id {} _NET_WM_PID)
done

wmctrl -ir $lid -b add,hidden
