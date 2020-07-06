#!/bin/sh

polybar-msg cmd show
xdo raise -a "polybar-level_eDP1"

sleep 1

[ "$(pidof -x $0 | wc -w)" -le "2" ] \
	&& polybar-msg cmd hide

