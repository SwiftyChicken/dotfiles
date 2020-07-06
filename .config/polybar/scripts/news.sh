#!/bin/env bash

file=/tmp/news

ex="false"
[ ! -f $file ] || [ ! -s $file ] && ex="true"

mail=$(head -n1 $file)
rss=$(tail -n1 $file)


if pidof newsboat > /dev/null; then
	icon="󰏑     " && mail="" && rss=""
else
	[ "$(echo "$mail+$rss" | bc)" -eq "0" ] && icon="󰚇     " && mail="" && rss="" || icon="󱉲"	
	
fi

[ "$rss" -eq "0" ] && rss="%{T4}󰛏%{T-}"
[ "$mail" -eq "0" ] && mail="%{T5}󰻈%{T-}"

mail=$(echo $mail | sed "s/^\(.\)$/\1  /")

[[ "$ex" == "false" ]] && echo " $icon%{T1}%{F#dae1ec}$mail%{T3}%{O-11}$rss%{T-}%{F-}" &

mail=$(echo "0")
rss=$(newsboat -x print-unread 2> /dev/null || tail -n1 $file)
echo "$mail" > $file
echo "${rss%% *}">> $file

[[ "$ex" == "true" ]] && exit 1 || exit 0
