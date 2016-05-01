# zgen stuff
source "$HOME/.zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load robbyrussell/oh-my-zsh plugins/colored-man
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load nojhan/liquidprompt
    zgen load chrissicool/zsh-256color
    zgen load zsh-users/zsh-completions src

    zgen save
fi

# General configuration
autoload -U compinit && compinit
autoload -U promptinit && promptinit

setopt autocd               # cd without writing cd
setopt extended_glob        # extended glob syntax
setopt nomatch              # print error if pattern matches nothing
setopt notify               # report status of background jobs immediately
setopt nohashdirs           # disable hashing of dirs so we don't have to run
                            # rehash after installing new binaries (performance hit?)


# Key stuff
bindkey -e
bindkey ';3D' emacs-backward-word
bindkey ';3C' emacs-forward-word
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char


# History
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space


# Completion

setopt complete_in_word     # complete from both ends of a word
setopt always_to_end        # move cursor to the end of a completed word
setopt path_dirs            # perform path search even on command names with slashes
setopt auto_menu            # show completion menu on a succesive tab press
setopt auto_list            # automatically list choices on ambiguous completion
setopt auto_param_slash     # if completed parameter is a directory, add a trailing slash
unsetopt menu_complete      # do not autoselect the first completion entry
unsetopt flow_control       # disable start/stop characters in shell editor

## Group matches and describe.
# zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

## Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

## Directories
eval $(dircolors <(awk '/^TERM/ && !x {print "TERM xterm-termite"; x=1} 1' <(dircolors -p)))
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

## History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes


# Correction

setopt correct              # spelling correction for commands
#setopt correctall           # spelling correction for arguments


# Misc aliases
alias ls='ls -F --color=auto'
alias ll='ls -lhF --color=auto'
alias la='ls -lhaF --color=auto'
alias grep='grep --color=auto'
alias sys='sudo systemctl'
alias sysu='systemctl --user'

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
alias irc='ssh -C oracle -t "tmux attach -t irc"'
alias steam-win='bash -c "cd .wine/drive_c/Program\ Files/Steam/ && wine steam.exe -no-dwrite"'
alias mount-mnt0='sshfs -p 225 svenstaro.crabdance.com:/media/data1 mnt0/'


# fasd
eval "$(fasd --init auto)"
alias j='fasd_cd -d'


# ssh keys
eval $(keychain --eval --agents ssh -Q --quiet arch_rsa id_rsa skeletonkey_rsa)


# fzf

# enables CTRL-T and CTRL-R fuzzy stuff
source /etc/profile.d/fzf.zsh

# unbind ALT-C because we don't want that
bindkey -r '\ec'

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$(pwd)}") | fzf-tmux --tac)
  cd "$DIR"
}
