# Check for an interactive session
[[ -z "$PS1" ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias grep='grep --color=auto'
alias sys='sudo systemctl'

alias svim='sudo vim'
alias spacman='sudo pacman'

alias mkchr='sudo extra-i686-build && sudo multilib-build'
alias mkchr32='sudo extra-i686-build'
alias mkchr64='sudo multilib-build'

alias db-move-packages='ssh nymeria.archlinux.org /packages/db-move'
alias db-move-community='ssh nymeria.archlinux.org /community/db-move'
alias db-update-packages='ssh nymeria.archlinux.org /packages/db-update'
alias db-update-community='ssh nymeria.archlinux.org /community/db-update'

export PS1='\[\e[0;32m\]\u\[\e[1;30m\]@\[\e[0;36m\]\h\[\e[0m\] \[\e[0;33m\]\w\[\e[0;37m\]\$\[\e[0m\] '
export PATH="/usr/lib/colorgcc/bin:$PATH"
export LC_TIME='de_DE.UTF-8'

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend                      # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

eval `keychain --eval -Q -q id_rsa`

complete -cf sudo
export EDITOR=vim
alias sharedir='python -m http.server'

alias irc='ssh -C apoc -t "tmux attach"'
alias steam-win='bash -c "cd .wine/drive_c/Program\ Files/Steam/ && wine steam.exe -no-dwrite"'
alias mount-mnt0='sshfs -p 225 svenstaro.lolwut.net:/media/data1 mnt0/'

alias wtfparrot='ssh trinity "DISPLAY=:0.0 mpv -fs --hwdec=no http://www.youtube.com/watch?v=fbfzahtZsN8"'

if [[ -n "$DISPLAY" ]]; then
	BROWSER=chromium
fi
