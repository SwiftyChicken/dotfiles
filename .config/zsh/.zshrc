#!/bin/sh
		##################
		## ZOOMER SHELL ##
		##################

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
# Enable colors and change prompt:
autoload -U colors && colors

setopt prompt_subst

nice_exit_code() {
	local exit_status="$1";
	# nothing to do here
	[[ -z $exit_status || $exit_status == 0 ]] && return;

	local sig_name;
	
	# is this a signal name (error code = signal + 128) ?
	case $exit_status in
		128)  sig_name=󰗖 ;;
		129)  sig_name=HUP ;;
		130)  sig_name=󰚌 ;;
		131)  sig_name=QUIT ;;
		132)  sig_name=ILL ;;
		134)  sig_name=ABRT ;;
		136)  sig_name=FPE ;;
		137)  sig_name=KILL ;;
		139)  sig_name=󰯇 ;;
		141)  sig_name=PIPE ;;
		143)  sig_name=󰯆 ;;
	esac

	# usual exit codes
	case $exit_status in
		-1)   sig_name=󰃤  ;;
		1)    sig_name=󰀨 ;; # Miscellaneous errors, such as "divide by zero"
		2)    sig_name=󰚑 ;; # misuse of shell builtins (pretty rare)
		126)  sig_name=󰦝 ;; # cannot invoke requested command (ex : source script_with_syntax_error)
		127)  sig_name=󰋗 ;; # command not found (ex : source script_not_existing)
	esac

	# assuming we are on an x86 system here
	# this MIGHT get annoying since those are in a range of exit codes
	# programs sometimes use.... we'll see.
	case $exit_status in
		6)  sig_name=󰨹 ;;
		16)  sig_name=󰺅 ;;
		19)  sig_name=󰅜 ;;
		20)  sig_name=TSTP ;;
		21)  sig_name=TTIN ;;
		22)  sig_name=TTOU ;;
		2*)  sig_name=󰋮  ;;
	esac

	echo "$sig_name"
}

nice_git_info () {
	local mesg="$(echo "$1"| sed "s/^.*\[\(.*\)\].*$/\1/")"
	local icon=""
	local color="white"
	case $mesg in
		master)	color="blue"
			icon="%{󰘬%G%}%f"
			;;
		*)	color="magenta"
			icon="%{󰓁%G%}%f"
			;;
	esac
	echo "%F{$color}[%f$mesg%F{$color}] $icon"
}

info () {
	local error="${1:-$(print -P %?)}"
	local mesg=$vcs_info_msg_0_
	[ ! -z "$mesg" ] \
		&& echo "$(nice_git_info $mesg $error)" \
		|| echo "%(?..%F{red}%{$(nice_exit_code $error)%G%}%f)"
	

}

RPS1='$(info)'

# Luke Smith prompt theme
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1~%{$fg[red]%}]%{$fg[white]%}%B$ %b%f"

# Minimalist prompt
PS1="%B%(?.%F{008}%f%K{008}%F{007} %~ %k%F{008}%f.%F{001}%f%K{001}%F{016} %~ %k%F{001}%f)%b %B%F{007}%f%K{007}%F{016}λ%k%F{007}%f%b "

function precmd {
	cmd="$(history | tail -1|sed 's/^ [0-9]*  *//')"
	if [[ "$NEW_LINE" = true ]] && [[ $cmd != "clear"* ]] && [[ $cmd != "reset" ]] then
		print ""
    	else
        	NEW_LINE=true
    	fi
}
# History configuration:
HISTFILE=~/.config/zsh/zish_history
HISTSIZE=1000
SAVEHIST=1000

setopt autocd notify

# Vim mode
bindkey -v
export KEYTIMEOUT=1

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/swifty/.config/zsh/.zshrc'

# Auto-Tab Completion:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump_$ZSH_VERSION
_comp_options+=(globdots)	# Includes hidden files
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#949ab7"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Man colours enabled
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# greeter
# hanka.sh

# Load aliases
source $HOME/.config/aliasrc

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=001,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=014,bold
ZSH_HIGHLIGHT_STYLES[alias]=fg=012,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=004,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=006,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=004,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=200,bold
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=010,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=129,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=006
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=006
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=200
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=011
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=003
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=013,bold
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=013,bold
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]=fg=009
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]=fg=009,bold
ZSH_HIGHLIGHT_STYLES[assign]=fg=009,bold
