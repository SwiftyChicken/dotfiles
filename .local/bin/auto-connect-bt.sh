#!/bin/sh

bluetoothctl power on >> /dev/null
sleep 1

devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
echo "$devices_paired" | while read -r line; do
bluetoothctl connect "$line" >> /dev/null
done

exit 0
