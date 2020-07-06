#!/bin/sh

ps aux| grep "polybar notify"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
ps aux| grep "polybar close"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
polybar open &
