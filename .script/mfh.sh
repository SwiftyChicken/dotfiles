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

# Storage place of $wid $pid [F|C|T]
WPF=/tmp/mpv-wpf.txt
pid=$2
wid=$(xmpv $2)

# handle different flags
case $1 in
	-a)	sed -i "s/^\([^ ]\+\)$/\1 $pid T/I" $WPF
		;;

	-r)	[ ! -z "$(grep -i "$pid F" $WPF)" ] \
		&& sed -i "/$pid/Id" $WPF \
		&& tail -1 $WPF | cut -d' ' -f1| xargs -L1 -I{} bspc node {} -t floating \
		&& tail -1 $WPF | cut -d' ' -f2| xargs -L1 -I{} xdotool key --window "{}" p \
		|| sed -i "/$pid/Id" $WPF
		;;

	-f)	bspc node $pid -g sticky=on
		sed -i "s/ F$/ C/I" $WPF
		sed -i "s/$pid T$/$pid F/I" $WPF
		grep -i " C$" $WPF | cut -d' ' -f1 |xargs -L1 -I{} bspc node {} -t tiled -g sticky=off -d '^3'
		[ ! -z "$(bspc wm -g| grep ":OIII:")" ] && bspc desktop -f last.occupied && bspc node -f newest.local.!floating
		;;

	-t)	if [ -z "$(grep -i "$pid C$" $WPF)" ]; then
			bspc node $pid -g sticky=off -d '^3' --follow
			sed -i "s/$pid F$/$pid T/I" $WPF
		else
			xdotool key --window "$pid" p
			sed -i "s/$pid C$/$pid T/I" $WPF
	fi
		;;

	*) exit 1
		;;
esac

exit 0
