###########################################################
#                 Downloads Organizer                     #
###########################################################
#!/bin/env bash

dwndir="$HOME/Downloads"
picdir="$HOME/Pictures/"
tmplist=$(mktemp)

function organizer () {
	ext=$(echo $1 | tr '[A-Z]' '[a-z]')
	type=$2
	path="$4"
	file="$5"
	hint="$(echo $6 | tr -d '[:blank:]' | tr '[A-Z]' '[a-z]')"

	case $type in
		image)	width=$(echo $hint | cut -d'x' -f1 )
			height=$(echo $hint | cut -d'x' -f2)
			[ "$width" -ge "1920" ] \
			&& [ "$height" -ge "1080" ] \
			&& [ "$width" -gt "$height" ] \
			&& new_path="$picdir/Wallpaper/.New"/$(date -r "$path" "+%s").$ext \
			|| new_path="$picdir/.Unclassified"/$(date -r "$path" "+%s").$ext \

			mv "$path" "$new_path"
			;;
		compressed)	echo "compressed ($ext): $file"
			;;
		*) echo "$type $ext $file" | tr '[a-z]' '[A-Z]'
	esac	
} #

find $dwndir -maxdepth 1 -type f > $tmplist
while read line; do
	file="$(echo $line | rev | cut -d'/' -f1 | rev)"
	[ -z "$(echo $file | grep -iE ".download$|^org.chrome.Chromium|.part$")" ] \
		&& organizer $(file -b "$line"| cut -d',' -f1) "$line" "$file" "$(identify "$line"| head -1 | sed -e "1 s/^.* \([0-9]\{3,4\}\s\?x\s\?[0-9]\{3,4\}\) .*$/\1/" )"
done < $tmplist

rm $tmplist
