
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'

if [[ $(which pacman-color 2> /dev/null) ]]; then
	alias pacman='pacman-color'
	alias spacman='sudo pacman-color'
else
	alias pacman='pacman'
	alias spacman='sudo pacman'
fi

export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
export PATH="/usr/lib/colorgcc/bin:$PATH"
export LC_TIME=de_DE

complete -cf sudo
export EDITOR=gvim
alias sharedir='python -m SimpleHTTPServer'

if [[ -n "$DISPLAY" ]]; then
	BROWSER=chromium
fi
