#!/bin/sh

app=$(echo $0|rev |cut -d'/' -f1| rev)

# Flagshandler
site="unknown"
while getopts ":ytcs" OPTIONS; do
  case $OPTIONS in
    t) site="twitch"
         ;;
    s) site="stream"
         ;;
    c) site="twitchClips"
         ;;
    \?) echo "$app: Unrecognized option '-$OPTARG'">&2
         exit 1
     esac
done

shift "$((OPTIND-1))"

number="$(date "+%s")"
mpvsocket="/tmp/mpvs.$number"

function error () {
	dunstify -r 5864642 -u critical "MPV" "Sorry, mpv ran\ninto a problem..."
	grep "^[0-9]\+$" /tmp/mpv-wpf.txt && sed -i "/^[0-9]\+$/d" /tmp/mpv-wpf.txt
	exit 1
} #

while grep "^[0-9]\+$" /tmp/mpv-wpf.txt > /dev/null 2>&1; do
	sleep 0.1
done

echo "$number" >> /tmp/mpv-wpf.txt

case $site in
	twitchClips)  	nohup streamlink -p "mpv --input-ipc-server=$mpvsocket" --twitch-low-latency $1 best > /dev/null 2>&1 || nohup mpv --input-ipc-server=$mpvsocket --profile=low-latency "$1" > /dev/null 2>&1 || error
		      	;;

	     twitch)  	nohup streamlink -p "mpv --input-ipc-server=$mpvsocket" --twitch-low-latency $1 best > /dev/null 2>&1 || error
			streamer=$(echo $1 | cut -d'/' -f4)
			# bspc desktop '^3' -l tiled
			# bspc desktop -f '^3' && surf "www.twitch.tv/$streamer/chat" > /dev/null 2>&1 && bspc desktop '^3' -l monocle
		      	;;

	     stream)  	nohup mpv --input-ipc-server=$mpvsocket "$1" > /dev/null 2>&1 || error
		      	;;
			
		  *)  	nohup mpv --input-ipc-server=$mpvsocket --profile=low-latency "$1" > /dev/null 2>&1 || error
			;;
esac 

