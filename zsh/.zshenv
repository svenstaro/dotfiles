export ANSIBLE_NOCOWS=1
export EDITOR=vim
export BROWSER=chromium

# Workaround core-utils not currently supporting termite
if $(tput -T xterm-termite colors &> /dev/null); then
    export TERM=xterm-termite
else
    export TERM=xterm-256color
fi
