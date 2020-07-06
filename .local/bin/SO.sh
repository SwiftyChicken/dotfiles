#!/bin/sh

###########################################################
#                     SWALOW OBSERVER                     #
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
	
	dunstify -r "991059" "Script" "SO has been reloaded"

done

# Watch if nvim opens markdown preview to use swallowing
bspc subscribe node_add node_remove|while read -r line; do

node=$(echo $line| rev | cut -d' ' -f1| rev)
if [[ "$(xclass $node)" == "Vim" ]]; then
	pidswallow $node &

fi
done
