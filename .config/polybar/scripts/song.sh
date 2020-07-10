#!/bin/sh

function scroll () {
	prefix="$1"
	scrolling="$2"
	temp="$(echo "$scrolling"| sed "s/^\(.\{25\}\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$//")"
	suffix="$3"
	echo "$prefix $temp $suffix"
	sleep 0.5

	zscroll -l 25 \
        	--delay 0.2 \
		--before-text "$prefix " \
		--after-text " $suffix" \
		--scroll-padding "  " \
        	--match-command "playerctl --player=playerctld status" \
        	--match-text "Playing" "--scroll 1" \
        	--match-text "Paused" "--scroll 0" \
		--update-check true "echo ' '$(get_title)' '" &

	wait
} #

function get_artist () {
	echo "$(playerctl -p spotify metadata --format "{{ artist }}"| sed -e "s/[[(]....*[])]*//g" | sed "s/ *$//"| sed "s/^\(.\{20\}[^ ]*\)\(.*\)$/\1[\2]/"| sed "s/\[ *\]$//"| sed "s/\[.*\]$/.../")"
} #
function get_title () {
	echo "$(playerctl -p spotify metadata --format "{{ title }}" |sed -e "s/^[[(]....*[])] *//g"| sed -e "s/[-[(]....*[])]*//g" | sed "s/ *$//"| sed 's/'\''/\\'\''/g')"
} #

[ ! -z "$(playerctl -p spotify status 2>/dev/null)" ] \
	&& artist=$(get_artist) \
	&& title=$(get_title) \
	&& ([ -z "$artist$title" ] && scroll "" "Spotify is not connected on this pc" "" || scroll "%{F#1db954}$artist%{F#FFF} [%{T7}" " $title " "%{T-}]%{F-}" ) \
	|| exit 1

