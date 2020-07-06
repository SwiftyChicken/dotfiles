#!/bin/env bash

file=/tmp/cpu

ex="false"
[ ! -s $file ] && ex="true"

useage=$(head -n1 $file)
temperature=$(tail -n1 $file)

useage=$(echo "${useage%%.*}" | sed "s/^\(..\)$/\1  /" | sed "s/^\(.\)$/\1    /" )

[[ "$ex" == "false" ]] && echo "%{T1}%{F#dae1ec}$useage%{T3}%{O-19}$temperature%{T-}%{F-}"

useage=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat)| tr -s ' ' | cut -d' ' -f2,4,5| tr '\n' ' '| sed "s/^\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) $/(\1-\4+\2-\5)*100\/(\1-\4+\2-\5+\3-\6)/g"| calc -dp)
temperature=$(cat /sys/class/thermal/thermal_zone*/temp | tail -n1 | sed 's/...$/°/')

echo "$useage" > $file
echo "$temperature" >> $file
[[ "$ex" == "true" ]] && exit 1 || exit 0
