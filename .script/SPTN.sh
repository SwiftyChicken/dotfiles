#!/bin/sh

###########################################################
#                        SPOTIFY TRACK OBSERVER		  #
###########################################################

# Prevent termination at startup
sleep 3

# Replace if already running
running=$(pidof -x $0)

while [ "$(echo $running | wc -w)" -gt "2" ]; do
	
	oldprocess=$(echo $running| rev| cut -d' ' -f1| rev)
	
	kill $oldprocess
	sleep 1
	
	running=$(pidof -x $0)
	
	dunstify -r "991059" "Script" "SPTN has been reloaded"

done

# Watch if spotify change its track
playerctl -F metadata mpris:trackid 2> /dev/null|while read -r line; do
	$HOME/.config/dunst/scripts/spotify.sh &
done
