export ANSIBLE_NOCOWS=1
export EDITOR=vim
export BROWSER=chromium
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_TIME=de_DE.UTF-8
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export FZF_CTRL_R_OPTS=-s

# Workaround for core-utils not currently supporting termite
if [[ -n $TMUX ]]; then
    export TERM=tmux-256color
elif $(tput -T xterm-termite colors &> /dev/null); then
    export TERM=xterm-termite
else
    export TERM=xterm-256color
fi
