#!/bin/sh

dir="$(echo $1 |sed "s/\/[^\/]*$/\//")"
sxiv -a $1 $dir &
