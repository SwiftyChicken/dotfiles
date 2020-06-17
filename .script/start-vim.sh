#!/bin/sh

title="$(echo $1 |rev |cut -d'/' -f1 |rev )"
[ -z "$title" ] && title="Nvim - Untitled" || title="Nvim - $title"

# Flagshandler
w=""
c=""
while getopts ":wc" OPTIONS; do
  case $OPTIONS in
    w  ) w="true"
         ;;
    c  ) c="true"
         ;;
    \? ) echo "Nvim: Unrecognized option '-$OPTARG'">&2
         exit 1
     esac
done

shift "$((OPTIND-1))"

[ ! -z "$w" ] \
	&& alacritty --config-file $HOME/.config/alacritty/vim.yml -t "$title" --class vim,Vim -e nvim $1 \
	&& exit 0

[ ! -z "$c" ] \
	&& (setsid -f alacritty --config-file $HOME/.config/alacritty/vim.yml -t "$title" --class vim,Vim -e nvim -c ":call ToggleNetrw()" $1 > /dev/null 2>&1) \
	&& exit 0

setsid -f alacritty --config-file $HOME/.config/alacritty/vim.yml -t "$title" --class vim,Vim -e nvim $1 > /dev/null 2>&1 
exit 0
