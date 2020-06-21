#!/bin/sh

[ ! -z "$(playerctl -p spotify status 2>/dev/null)" ] \
	&& artist=$(playerctl -p spotify metadata --format "{{ artist }}"| sed -e "s/[[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../") \
	&& title=$(playerctl -p spotify metadata --format "{{ title }}"|sed -e "s/^[[(]....*[])] *//g"| sed -e "s/[-,[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../") \
	&& echo "%{F#1db954}$artist%{F#FFF} [ $title ]%{F-}" \
	|| exit 1

