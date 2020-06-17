#!/bin/sh

transmission-daemon &
xsetroot -cursor_name left_ptr &
setxkbmap be && exec sxhkd &
picom --experimental-backends --backend glx -b &
dunst &
dock.sh &
auto-connect-bt.sh &
remaps &
timer-checkupdates.sh &
newsboat -x reload &
SPTN.sh &
MO.sh &
exec bspwm

