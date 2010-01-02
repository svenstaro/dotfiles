if [[ $# -ge 1 ]]; then
    game="`which $1`"
    openbox="`which openbox`"
    tmpgame="/tmp/tmpgame.sh"
    DISPLAY=:1.0
    if [[ $1 == steam ]]; then 
        echo -e "${openbox} &\n$HOME/steam.sh" > ${tmpgame}
    else 
        echo -e "${openbox} &\n${game}" > ${tmpgame}
    fi
    echo "starting ${game}"
    xinit ${tmpgame} -- :1 -xf86config xorg-game.conf || exit 1
else
    echo "not a valid argument"
fi
