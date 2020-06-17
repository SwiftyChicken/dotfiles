#!/bin/sh

setsid -f alacritty -t newsboat --class rss,newsboat -e newsboat > /dev/null 2>&1
sleep 5

count=0
while pidof newsboat && [ "$count" -lt "55" ] ; do
	sleep 1
	count=$[$count+1]
done
	
xdo close -N newsboat

exit 0
