export ANSIBLE_NOCOWS=1
export EDITOR=vim
export BROWSER=firefox
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_MONETARY=de_DE.UTF-8
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export FZF_CTRL_R_OPTS=-s
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
export PATH=${PATH}:~/.cargo/bin:~/.yarn/bin:~/.pub-cache/bin:~/flutter/bin

# Workaround for core-utils not currently supporting termite
if [[ -n $TMUX ]]; then
    export TERM=tmux-256color
elif $(tput -T xterm-termite colors &> /dev/null); then
    export TERM=xterm-termite
else
    export TERM=xterm-256color
fi
