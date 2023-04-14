#!/bin/bash

script_name=${BASH_SOURCE[0]}
for pid in $(pidof -x $script_name); do 
  if [ $pid != $$ ]; then
    kill -9 $pid
  fi 
done

xdo raise -N eww-control
eww update control_reveal=true 
sleep 0.8
eww update control_reveal=false

