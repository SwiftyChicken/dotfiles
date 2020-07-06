#!/bin/sh

###########################################################
#                        MPV OBSERVER                     #
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
	
	dunstify -r "991059" "Script" "MO has been reloaded"

done

# Watch if mpv instances change state, are opened or are closed and notifies it
bspc subscribe node_add node_remove node_state|while read -r line; do

action=$(echo $line| cut -d' ' -f1)
node=$(echo $line| rev | cut -d' ' -f1| rev)

if [[ "$action" == "node_remove" ]]; then
	mfh.sh -r $node

elif [[ "$action" == "node_add" ]] && [[ "$(xclass $node)" == "mpv" ]]; then
	mfh.sh -a $node

else
	node=$(echo $line| cut -d' ' -f4)
	state=$(echo $line| cut -d' ' -f5)
	status=$(echo $line| cut -d' ' -f6)
	
	[[ "$state" == "floating" ]] && [[ "$(xclass $node)" == "mpv" ]] \
		&& case "$status" in
			
			off)    mfh.sh -t $node ;;
			on)     mfh.sh -f $node ;;
		esac
fi
done
