#!/bin/sh

msgId="991049"
new_pkg=$(mktemp)
all_pkg=$(mktemp)
pacman -Qqe > "$all_pkg"

# Get "[datetime] [ALPM] installed" of last installed
t=$(grep installed /var/log/pacman.log|tail -n1| cut -d' ' -f1)

# Get list of last installed files
fgrep "$t" /var/log/pacman.log | grep installed |cut -d' ' -f4 > "$new_pkg"

while read p; do
	[ ! -z "$(grep "^$p$" "$all_pkg")" ] && /usr/bin/sudo -u swifty DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus dunstify -r "$msgId" "Pacman" ""${p^}" has been installed" 
done < $new_pkg


rm "$new_pkg" "$all_pkg"
