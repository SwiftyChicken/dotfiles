#!/bin/sh
if xdotool search --name "polybar-music_eDP-1"; then
	xdo kill -a "polybar-music_eDP-1"
else
	setsid -f polybar music & 
	count=0
	while ! xdotool search --name "polybar-music_eDP-1" && [ "$count" -lt "10" ] ; do
		sleep 0.5
		count=$[$count+1]
	done

	count=0

	while xdotool search --name "polybar-music_eDP-1" && [ "$count" -lt "10" ] ; do
		sleep 1
		count=$[$count+1]
	done

	xdo kill -a "polybar-music_eDP-1"
fi

exit 0
