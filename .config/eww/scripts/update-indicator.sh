#!/bin/bash

CURRENT_WORKSPACE="$(($(xprop -root _NET_CURRENT_DESKTOP | cut -d' ' -f3)+1))"
OCCUPIED_WORKSPACES="$(wmctrl -l | tr -s ' ' | cut -d' ' -f2 | sed 's/^\(.*\)$/\1+1/' | bc)"
OCCUPIED_WORKSPACES="$(printf "$CURRENT_WORKSPACE\n$OCCUPIED_WORKSPACES" | sort -n | uniq)"
INDICATOR_WORKSPACE="$(printf "$OCCUPIED_WORKSPACES"| grep -n "^$CURRENT_WORKSPACE$" | cut -d':' -f1)"

echo "$INDICATOR_WORKSPACE"
