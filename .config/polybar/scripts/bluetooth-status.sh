#!/bin/sh

! command -v bluetoothctl &> /dev/null && echo "%{F#6c809e}󰂯%{F-}" && exit 0

# Flagshandler
app=$(echo $0|rev |cut -d'/' -f1| rev)
toggle="false"
while getopts ":t" OPTIONS; do
  case $OPTIONS in
    t  ) toggle="true"
         ;;
    \? ) echo "$app: Unrecognized option '-$OPTARG'">&2
         exit 1
	 ;;
     esac
done

shift "$((OPTIND-1))"

bluetooth_print() {
	local power=off
	local connected=no
	[[ $(bluetoothctl show |grep Powered:) == *"yes"* ]] \
		&& power=on
	
	[[ "$power" == "on" ]] \
		&& local paired=$(bluetoothctl paired-devices | grep Device | cut -d' ' -f2)
	while read device; do
		[[ "$connected" == "no" ]] \
			&& info=$(bluetoothctl info "$device") \
			&& [[ "$(grep 'Connected:' <<< $info)" == *"yes"* ]] \
			&& connected=yes
	done <<< $paired

	if [[ "$power" == "off" ]]; then
		echo "%{F#6c809e}󰂲%{F-}"
	else
		[[ "$connected" == "yes" ]] \
			&& echo "󰂱" \
			|| echo "󰂯"
	fi
}

bluetooth_toggle() {
	! command -v bluetoothctl &> /dev/null && dunstify -r "991043" "Bluetooth" "bluez-utils isn't installed" && exit 1
    if bluetoothctl show | grep -q "Powered: no"; then
	dunstify -r "991043" "Bluetooth" "Turning power ON" &
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
	dunstify -r "991043" "Bluetooth" "Turning power OFF" &
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

[ $# -ne 0 ] \
	&& echo "Pleas! Don't give me this bullshit..." \
	&& exit 1

case "$toggle" in
	true) bluetooth_toggle
		;;
	false) bluetooth_print
		;;
esac
