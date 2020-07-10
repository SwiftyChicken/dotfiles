#!/bin/sh

# Replace if already running
running=$(pidof -x $0)

while [ "$(echo $running | wc -w)" -gt "1" ]; do
	
	oldprocess=$(echo $running| rev| cut -d' ' -f1| rev)
	
	kill $oldprocess
	sleep 1
	
	running=$(pidof -x $0)
done

temp=$(mktemp)

playerctl -p spotify metadata --format "{{ artist }}\n{{ title }}\n{{mpris:artUrl}}"|xargs -0I{} printf "{}" > $temp

artist=$(sed '1q;d' $temp| sed -e "s/[,[(]....*[])]*//g"| sed "s/ *$//"| sed "s/^\(.\{28\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../")
title=$(sed '2q;d' $temp| sed -e "s/[-[(]....*[])]*//g"| sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../" )

# Don't notify empty
[ -z "$artist$title" ] && exit 0

curl "$(sed '3q;d' $temp| sed "s/open\.spotify\.com/i.scdn.co/")" > /tmp/spt.jpeg \
	|| cp $HOME/.config/dunst/scripts/error.png /tmp/spt.jpeg \
	&& dunstify -r "991361" -i /tmp/spt.jpeg "$title" "<span foreground='#1DB954' font_desc='UbuntuMono Nerd Font 32'>󰓇<span font_desc='UbuntuMono Nerd Font 14'> </span><b>Spotify</b> </span><span font_desc='UbuntuMono Nerd Font 4'>\n \n</span><span font_desc='UbuntuMono Nerd Font 22'><b>$artist</b></span>"

rm $temp

