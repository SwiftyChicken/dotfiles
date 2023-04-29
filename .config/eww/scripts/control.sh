#!/bin/bash

script_name=${BASH_SOURCE[0]}
for pid in $(pidof -x $script_name); do 
  [ "$pid" != "$$" ] && kill -9 $pid
done

xdo raise -N eww-control
eww update control_reveal=true 
sleep 0.8
eww update control_reveal=false

