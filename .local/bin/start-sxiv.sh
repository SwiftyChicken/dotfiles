#!/bin/sh

dir="$(echo "$1" |sed "s/\/[^\/]*$/\//")"
sxiv -a "$1" "$dir" &
while [ -z "$(wmctrl -lx | tr -s ' ' | cut -d' ' -f3 | grep "sxiv.Sxiv")" ] ; do sleep 0.1 ; done
xdotool search --class sxiv set_window --urgency 1
