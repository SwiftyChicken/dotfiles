#!/bin/sh

lid=$(cat /tmp/lfID);\
wmctrl -ir $lid -b toggle,hidden && wmctrl -ia $lid

focus=$(xprop -root _NET_ACTIVE_WINDOW| rev | cut -d' ' -f1 | rev| sed "s/^0x/0x0/")
while [[ "$focus" == "$lid" ]]; do
	sleep 1
	focus=$(xprop -root _NET_ACTIVE_WINDOW| rev | cut -d' ' -f1 | rev| sed "s/^0x/0x0/")
done

wmctrl -ir $lid -b add,hidden
