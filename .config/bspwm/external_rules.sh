#!/usr/bin/env sh

wid=$1
class=$2
title=$(xtitle $wid)
instance=$3

if [ "$class" = "Surf" ] ; then
	xdotool windowsize $wid 1835 955

elif [ "$class" = "Dragon-drag-and-drop" ] ; then
	xdo raise -a "Dragon-drag-and-drop"
        xdotool windowmove $wid 10 40

elif [ "$class" = "mpv" ] ; then
	sed -i "$ s/^\([0-9]\+\)$/$wid \1/" /tmp/mpv-wpf.txt
	xdotool windowsize $wid 450 250
  xdotool windowmove $wid 1450 720

elif [ "$class" = "Zathura" ] ; then
	xdotool windowsize $wid 1160 1080

elif [ "$title" = "GNU Image Manipulation Program" ] ; then
	xdotool windowsize $wid 1450 900
  xdotool windowmove $wid 225 50
	xdo lower -r $wid

fi

# Fix Spotify
case "$class" in
    (foo)
        bar;;
    ("")
        unset -v _NET_WM_PID;
        . /dev/fd/0 2>/dev/null <<IN
        : \"\${$(
            xprop \
                -id "$wid" \
                -notype \
                -f _NET_WM_PID 32c '=$0' \
                _NET_WM_PID;
        )}\";
IN
        case "$(ps -p "${_NET_WM_PID:?}" -o comm= 2>/dev/null)" in
            (spotify)
                echo desktop=^10 state=pseudo_tiled rectangle=1650x900+200+80;;
        esac;;
esac;
