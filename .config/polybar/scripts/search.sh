#!/bin/sh

[ "$(pidof -x $0| wc -w)" -gt "2" ] \
	&& xdotool key Escape \
	&& exit 1

dmenu_run -q -name search -class search -b -y 7 -x 180 -i -h 46 -w 500 -sb "#111111" -nb "#dae1ec" -nf "#000000" -fn "BreezeSans-18" -o 0.7

# Work in progress planning on adding a sort of bang functionality like duckduckgo
# query=$(dmenu -noinput -name search -class search -b -y 7 -x 180 -i -h 46 -w 500 -nb "#dae1ec" -nf "#000000" -fn "BreezeSans-18" -o 0.7)
#[ -z "$query" ] && exit 1

#dunstify "search" "$query"
