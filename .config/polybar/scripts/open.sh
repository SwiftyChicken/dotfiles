#!/bin/sh

ps aux| grep "polybar open"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
polybar notify &
polybar close & 
