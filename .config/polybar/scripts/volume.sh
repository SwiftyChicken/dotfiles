#!/bin/sh


# Replace if already running
running=$(pidof -x $0)

while [ "$(echo $running| wc -w)" -gt "1" ]; do
	oldprocess=$(echo $running| rev| cut -d' ' -f1| rev)
	kill $oldprocess
	running=$(pidof -x $0)
done

polybar-msg cmd show
xdo raise -a "polybar-level_eDP1"

sleep 0.8
polybar-msg cmd hide

