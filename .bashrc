# Check for an interactive session
[[ -z "$PS1" ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'
alias sys='sudo systemctl'

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
alias db-update='ssh nymeria.archlinux.org /srv/repos/svn-community/dbscripts/db-update'

export PS1='\[\e[0;32m\]\u\[\e[1;30m\]@\[\e[0;36m\]\h\[\e[0m\] \[\e[0;33m\]\w\[\e[0;37m\]\$\[\e[0m\] '
export PATH="/usr/lib/colorgcc/bin:$PATH"
export LC_TIME='de_DE.UTF-8'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

eval `keychain --eval -Q -q SOME KEYS`

complete -cf sudo
export EDITOR=vim
alias sharedir='python -m http.server'

alias irc='ssh apoc -t "tmux attach"'

if [[ -n "$DISPLAY" ]]; then
	BROWSER=chromium
fi
