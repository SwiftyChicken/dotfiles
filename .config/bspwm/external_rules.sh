#!/bin/sh

wid=$1
class=$2
title=$(xtitle $wid)
instance=$3

if [ "$class" = "scratchpad" ] ; then
        xdotool windowmove $wid 10 720

elif [ "$class" = "lf" ] ; then
        xdotool windowmove $wid 10 600

elif [ "$class" = "mpv" ] ; then
	echo "$wid" >> /tmp/mpv-wpf.txt
	xdotool windowsize $wid 450 250
        xdotool windowmove $wid 1450 720

elif [ "$class" = "Zathura" ] ; then
	xdotool windowsize $wid 1160 1080

elif [ "$title" = "GNU Image Manipulation Program" ] ; then
	xdotool windowsize $wid 1450 900
        xdotool windowmove $wid 250 75

elif [ "$title" = "Spotify Premium" ] ; then
	xdotool windowsize $wid 1650 900
        xdotool windowmove $wid 200 80
	xdo lower -r $wid
fi
