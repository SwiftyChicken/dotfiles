#!/bin/sh

file=/tmp/updates

ex="false"
[ ! -f $file ] || [ ! -s $file ] && ex="true"

pacman=$(head -n1 $file)
yay=$(tail -n1 $file)


[ "$(echo "$pacman+$yay" | bc)" -eq "0" ] && icon="󰏖" && pacman="" && yay="%{O13}%{T4}󰄬%{T-}" || icon="󰏗"
[ "$yay" -eq "0" ] && yay="%{T4}󰋚%{T-}"
[ "$pacman" -eq "0" ] && pacman="%{T5}󰋚%{T-}"
[ -f /var/lib/pacman/db.lck ] && icon="󰏗" && pacman="%{T5}󰒓%{T-}" && yay="%{T4}󰇚%{T-}"

pacman=$(echo $pacman | sed "s/^\(.\)$/\1  /")

[[ "$ex" == "true" ]] && exit 1 || echo "$icon%{T1}%{F#dae1ec}$pacman%{T3}%{O-13}$yay%{T-}%{F-}" 
exit 0
