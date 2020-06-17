#!/bin/sh

found=false
[ -f /tmp/touchpad ] || [ ! -z "$(sudo libinput list-devices| grep "DLL075B:01 06CB:76AF Touchpad")" ] \
	&& found=true \
	&& ( [ -f /tmp/touchpad ] || touch /tmp/touchpad )

[[ "$found" == "true" ]] \
&& case $1 in
	on) xinput --enable 'DLL075B:01 06CB:76AF Touchpad'
		;;
	off) xinput --disable 'DLL075B:01 06CB:76AF Touchpad'
		;;
esac
