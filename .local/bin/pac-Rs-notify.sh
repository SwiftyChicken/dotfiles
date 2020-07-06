#!/bin/sh

/usr/bin/sudo -u swifty DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Pacman" "Package has been succesfully removed!"
