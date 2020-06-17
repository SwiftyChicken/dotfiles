#!/bin/sh
		##################
		## ZOOMER SHELL ##
		##################

# Enable colors and change prompt:
autoload -U colors && colors

setopt prompt_subst

nice_exit_code() {
	local exit_status="${1:-$(print -P %?)}";
	# nothing to do here
	[[ -z $exit_status || $exit_status == 0 ]] && return;

	local sig_name;
	
	# is this a signal name (error code = signal + 128) ?
	case $exit_status in
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

RPS1='%(?.%F{green}%{󰦕%G%}.%F{red}%{$(nice_exit_code)%G%}%f)'

# Luke Smith prompt theme
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1~%{$fg[red]%}]%{$fg[white]%}%B$ %b%f"

# Minimalist prompt
PS1="
%B%(?.%F{green}%~.%F{red}%~)%f%{$fg[white]%} $ %b"

# History configuration:
HISTFILE=~/.config/zsh/zish_history
HISTSIZE=1000
SAVEHIST=1000

setopt autocd notify

# Vim mode
bindkey -v

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

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

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

# Load aliases
source $HOME/.config/aliasrc
