#!/bin/sh

## DESCRIPTION:
# Help making annotation in LaTeX for a PDF file.
# By using the clipboard.
# The original idea is from:
# GitLab:       https://gitlab.com/Iduoad/
# Author:       Mohammed Daoudi

## COLORS
red="\e[1;31m"
green="\e[1;32m"
magenta="\e[1;35m"
blue="\e[1;34m"
bold=$(tput bold)
normal=$(tput sgr0)

## HANDLE FLAGS
app=$(basename $0)

# Flag Variables
_view="false"
_edit="false"
_help="false"
_skip="false"

while getopts ":hev" OPTIONS; do
  case $OPTIONS in
	h)
		_help="true"
		_skip="true"
		;;
	e)
		_edit="true"
		;;
	v)
		_view="true"
		;;
	\?)
		echo -e "${red}${bold}error:${normal} Unrecognized option '-$OPTARG'">&2
		exit 1
		;;
  esac
done

shift "$((OPTIND-1))"

## CHECK ARGUMENTS

## VARIABLES
if [[ "$_skip" == "false" ]]; then
notes_folder="$HOME/Documents/.Notes"
template="$notes_folder/Utils/template.tex"
pdf="$@"
note="$notes_folder/$(md5sum "$@" | cut -f1 -d' ').tex"
fi

## FUNCTIONS
function help () {
echo -e "${bold}AVAILABLE FLAGS:${normal}
${magenta}h${normal}	Show this help manual.
${magenta}e${normal}	Open note file in ${red}\$EDITOR${normal}.
${magenta}v${normal}	Open pdf note file if a note exits.
	It won't compile the .tex if it find a .pdf version."
	exit 0
} #

function view () {
	[ ! -f "$note" ] \
		&& dunstify -r '97890' "Zathura annotation's" "<b>NO NOTES AVAILABLE</b>" \
		&& exit 1

	local compiled="$(echo $note| sed 's/tex$/pdf/')"

	[ ! -f "$compiled" ] \
		&& pdflatex -output-directory $notes_folder $note \
			&& (xdg-open $compiled && exit 0) \
			|| (dunstify -r '97890' "Zathura annotation's" "<b>COULD NOT COMPILE</b>" && exit 1)

	xdg-open $compiled
	exit 0
} #

function make_note () {
	local title="$(basename "$pdf" | cut -d'.' -f1)"
	local today=$(date '+%e %B %Y')
	local folder="$notes_folder/Utils/"

	cp "$template" "$note"

	sed -i "s/<title>/$title/" $note
	sed -i "s/<date>/$today/" $note
	sed -i "s|<folder>|$folder|" $note
} #

function annotate () {
sed -i "/\\end{document}/d" "$note"

echo "% <!!> %begin%
\begin{minipage}{\textwidth}
\begin{center}------------------------------------------------------------------------------------------\end{center}
\begin{justify}
\textit{" >> "$note"

clipboard=$(mktemp)
xclip -out -selection clipboard > $clipboard
# Delete new line
tr "\n" " " < $clipboard| tee $clipboard

# Join splitted words
sed -i "s/\([^ ]*\)- \([^ ]*\)/\1\2/" $clipboard
# Add quotes
sed -i "1 s/^\(.\)/\`\`\1/" $clipboard
sed -i "$ s/\(.\)$/\1''/" $clipboard
# Indent new line after each phrase
sed -i "s/\. /\. \n/" $clipboard
# Correct notation for LaTeX
correct_notation $clipboard
cat $clipboard >> "$note"
rm $clipboard

echo "
}
\end{justify}
\begin{center}---------------------------------------------------------\end{center}
\end{minipage}
\begin{equation}\label{1}
	<!!>
\end{equation}
\textsf{\footnotesize{
	\begin{center}
		\fancy{<time>}\\
	\end{center}
$>$\hspace{0.3cm} <!!>
}}
\bigbreak
%end%
\end{document}" >> "$note"
} #

function correct_notation () {
	local file="$1"
	sed -i -e "s/\([{}]\)/\\\\\1/g" $file
	sed -i -e "s/∈/$\\\in$/g" $file
	sed -i -e "s/∋/$\\\ni$/g" $file
	sed -i -e "s/⊂/$\\\subset$/g" $file
	sed -i -e "s/⊆/$\\\subseteq$/g" $file
	sed -i -e "s/ ̸=/ $\\\ne$/g" $file
	sed -i -e "s/∩/$\\\cap$/g" $file
	sed -i -e "s/→/$\\\to$/g" $file
	sed -i -e "s/[ϵε]/$\\\varepsilon$/g" $file
} #

function add_note () {
	local time=$(date '+%a %e %b %H:%M')

	annotate
	sed -i "s/<time>/$time/" $note

	local start=$(xclip -out -selection clipboard |sed '/^\s*$/d'| head -1 | cut -d' ' -f1-8)
	local end=$(xclip -out -selection clipboard | sed '/^\s*$/d'| sed "/$start/d"| tail -1 | rev| cut -d' ' -f1-8 | rev)
	local lines=$[$(xclip -out -selection clipboard | wc -l) + 1]

	[ ! -z "$end" ] && end="...$end"
	[[ "$lines" == "1" ]] && lines="1 line" || lines="$lines lines"

	dunstify -r '97890' "Zathura annotation's" "<b>$lines added:</b>\n{ <span font_desc='BreezeSans 14'><i>$start$end</i></span>}"

} #

## MAIN PROGRAM
[[ "$_help" == "true" ]] && help
[[ "$_view" == "true" ]] && view

[ ! -f "$note" ] && make_note

[[ "$_edit" == "true" ]] && $EDITOR -t $note || add_note

exit 0
