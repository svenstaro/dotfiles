# General configuration
autoload -U compinit promptinit
compinit
promptinit

setopt HIST_IGNORE_DUPS

# powerline-shell
function powerline_precmd() {
  export PS1="$(~/prj/powerline-shell/powerline-shell.py $? --colorize-hostname --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

# Aliases
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

alias pyserve='python -m http.server'
alias irc='ssh -C apoc -t "tmux attach"'
alias steam-win='bash -c "cd .wine/drive_c/Program\ Files/Steam/ && wine steam.exe -no-dwrite"'
alias mount-mnt0='sshfs -p 225 svenstaro.crabdance.org:/media/data1 mnt0/'

# Exports
eval `keychain --eval -Q -q id_rsa`
export EDITOR=vim
