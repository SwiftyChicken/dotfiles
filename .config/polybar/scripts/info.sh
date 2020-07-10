#!/bin/sh

if xdotool search --name "polybar-music_eDP1"; then
	xdo kill -a "polybar-music_eDP1"
else
	setsid -f polybar music & 
	count=0
	while ! xdotool search --name "polybar-music_eDP1" && [ "$count" -lt "30" ] ; do
		sleep 0.1
		count=$[$count+1]
	done

	count=0

	while xdotool search --name "polybar-music_eDP1" && [ "$count" -lt "20" ] ; do
		sleep 1
		count=$[$count+1]
	done

	xdo kill -a "polybar-music_eDP1"
fi

exit 0
