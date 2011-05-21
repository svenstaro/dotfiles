# Check for an interactive session
[[ -z "$PS1" ]] && return

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

alias svim='sudo vim'

alias mkchr='sudo extra-i686-build && sudo multilib-build'
alias mkchr32='sudo extra-i686-build'
alias mkchr64='sudo multilib-build'
alias db-aur='ssh sigurd.archlinux.org /arch/db-update'

export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '
export PATH="/usr/lib/colorgcc/bin:$PATH"
export LC_TIME='de_DE.UTF-8'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

complete -cf sudo
export EDITOR=gvim
alias sharedir='python -m http.server'

if [[ -n "$DISPLAY" ]]; then
	BROWSER=chromium
fi
