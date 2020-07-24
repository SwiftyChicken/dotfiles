#!/bin/sh

title="$(echo $1 |rev |cut -d'/' -f1 |rev )"
[ -z "$title" ] && title="Nvim - Untitled" || title="Nvim - $title"

# Flagshandler
w=""
c=""
t=""
while getopts ":wtc" OPTIONS; do
  case $OPTIONS in
    w  ) w="true"
         ;;
    t  ) t="true"
	 ;;
    c  ) c="true"
         ;;
    \? ) echo "Nvim: Unrecognized option '-$OPTARG'">&2
         exit 1
     esac
done

shift "$((OPTIND-1))"

[ ! -z "$t" ] \
	&& (setsid -f alacritty --config-file $HOME/.config/alacritty/vim.yml -t "$title" --class vim,Note -e bash -c "sleep 0.1 && nvim '$1'" > /dev/null 2>&1) \
	&& exit 0

[ ! -z "$w" ] \
	&& (setsid -f alacritty --config-file $HOME/.config/alacritty/vim.yml -t "$title" --class vim,Vim -e bash -c "sleep 0.1 && nvim '$1'" > /dev/null 2>&1) \
	&& exit 0

[ ! -z "$c" ] \
	&& setsid -f alacritty --config-file $HOME/.config/alacritty/vim.yml -t "$title" --class vim,Vim -e bash -c "sleep 0.1 && nvim -c ':call ToggleNetrw()'" > /dev/null 2>&1 \
	&& exit 0

alacritty --config-file $HOME/.config/alacritty/vim.yml -t "$title" --class vim,Vim -e bash -c "sleep 0.1 && nvim '$1'"
bspc node -f last
exit 0
