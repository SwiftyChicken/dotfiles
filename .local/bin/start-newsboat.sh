#!/bin/sh

setsid -f alacritty -t newsboat --class rss,newsboat -e newsboat > /dev/null 2>&1
while [ -z "$(wmctrl -lx | tr -s ' ' | cut -d' ' -f3 | grep "rss.newsboat")" ] ; do sleep 0.1 ; done

count=0
stop=60
while pidof newsboat && [ "$count" -lt "$stop" ] ; do
	sleep 1
	count=$[$count+1]
done
	
[ "$count" -ge "$stop" ] && xdo kill -N newsboat

[ ! -z "$(bspc wm -g| grep ":OIV:")" ] && bspc desktop -f last.occupied && bspc node -f newest.local.!floating

exit 0
