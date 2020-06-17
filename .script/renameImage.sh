#!/bin/sh

[ -z "$1" ] && exit 1

img="$1"
new_name="$(date -r $img "+%s")"
new_img="$(echo $img| sed "s/\/[^\/]*\.\([^\.]*\)$/\/$new_name.\1/")"

mv $img $new_img
