#!/bin/sh

upgraded_pkg=$(mktemp)
all_pkg=$(mktemp)
pacman -Qqe > "$all_pkg"

# Get "[datetime] [ALPM] upgraded" of last upgraded
t=$(grep upgraded /var/log/pacman.log|tail -n1| cut -d' ' -f1)

# Get list of last upgraded files
fgrep "$t" /var/log/pacman.log |grep upgraded | cut -d' ' -f4 > "$upgraded_pkg"


Packages=""
while read p; do
	[ ! -z "$(grep "^$p$" "$all_pkg")" ] && Packages="$Packages ${p^}"
done < $upgraded_pkg

[ -z "$Packages" ] && Packages="Only dependencies..."

/usr/bin/sudo -u swifty DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Pacman" "The following packages have been upgraded:\n$Packages"
/usr/bin/sudo -u swifty DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus /home/swifty/.script/timer-checkupdates.sh > /dev/null 2>&1 &

rm "$upgraded_pkg" "$all_pkg"
