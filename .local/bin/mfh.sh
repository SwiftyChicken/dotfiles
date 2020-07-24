#!/bin/sh

#####################################################
#            	  MPV FLAG HANDLER		    #
#####################################################

# Bad usage
[ $# -ne 2 ] && exit 1

# Wait if already running
running=$(pidof -x $0)

while [ "$(echo $running| wc -w)" -gt "1" ] && [[ "$(echo $running |rev |cut -d' ' -f1 |rev )" != "$$" ]]; do
	running=$(pidof -x $0)
	sleep 1
done

# Storage place of $wid $pid [F|C|T] socket_number
WPF=/tmp/mpv-wpf.txt
pid=$2
wid=$(xmpv $2)

# handle different flags
case $1 in
	-a)	sed -i "s/^\([^ ]\+\) \([0-9]\+\)$/\1 $pid T \2/I" $WPF
		;;

	-r)	pause=""
		grep "$pid" $WPF && pause="true"
		grep -i "$pid" $WPF | cut -d' ' -f4 | xargs -I{} rm /tmp/mpvs.{}
		[ ! -z "$(grep -i "$pid F" $WPF)" ] \
		&& sed -i "/$pid/Id" $WPF \
		&& tail -1 $WPF | cut -d' ' -f1| xargs -L1 -I{} bspc node {} -t floating \
		|| sed -i "/$pid/Id" $WPF
		socket=$(tail -1 $WPF | cut -d' ' -f4)
		new_pid=$(tail -1 $WPF | cut -d' ' -f2)
		[ ! -z "$pause" ] && echo '{ "command": ["set_property", "pause", false] }' | socat - /tmp/mpvs.$socket \
			&& [ -z "$(grep "$new_pid F" $WPF)" ] \
			&& bspc node -f $new_pid
		;;

	-f)	bspc node $pid -g sticky=on
		sed -i "s/ F / C /I" $WPF
		sed -i "s/$pid T /$pid F /I" $WPF
		socket=$(grep -i " F " $WPF | cut -d' ' -f4)
		echo '{ "command": ["set_property", "pause", false] }' | socat - /tmp/mpvs.$socket
		grep -i " C " $WPF | cut -d' ' -f1 |xargs -L1 -I{} bspc node {} -t tiled -g sticky=off -d '^3'
		grep -i " [TC] " $WPF | cut -d' ' -f4 | while read socket; do 
			echo '{ "command": ["set_property", "pause", true] }' | socat - /tmp/mpvs.$socket
		done
		xdotool windowsize $pid 450 250
        	xdotool windowmove $pid 1450 720
		[ ! -z "$(bspc wm -g| grep ":OIII:")" ] && bspc desktop -f last.occupied && bspc node -f newest.local.!floating
		;;

	-t)	[ ! -z "$(grep -i " F " $WPF)" ] && bspc node $pid -g sticky=off -d '^3' --follow
		sed -i "s/$pid [FC] /$pid T /I" $WPF
		;;

	*) exit 1
		;;
esac

exit 0
