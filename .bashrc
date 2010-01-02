
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman-color'
alias spacman='sudo pacman-color'

export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

complete -cf sudo
export EDITOR=gvim
alias sharedir='python -m SimpleHTTPServer'

