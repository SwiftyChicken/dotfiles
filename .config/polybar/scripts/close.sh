#!/bin/sh

xdo kill -a "polybar-notify_eDP1"
xdo kill -a "polybar-close_eDP1"
polybar open &
