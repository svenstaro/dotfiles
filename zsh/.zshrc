# zplug stuff
zstyle ':prezto:module:terminal' auto-title 'yes'

source "$HOME/.zplug/init.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "nojhan/liquidprompt"
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-completions", use:src
zplug "modules/terminal", from:prezto
zplug load

# General configuration
autoload -U compinit && compinit
autoload -U promptinit && promptinit

setopt autocd               # cd without writing cd
setopt extended_glob        # extended glob syntax
setopt nomatch              # print error if pattern matches nothing
setopt notify               # report status of background jobs immediately

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
HISTSIZE=100000
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
zstyle ':completion:*:*:*:*:*' menu select
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
zstyle ':completion:*' rehash true  # Find new commands automatically

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
alias e='exa -F'
alias ee='exa -lgF --git'
alias grep='grep --color=auto'
alias sys='sudo systemctl'
alias sysu='systemctl --user'
alias ht='ht-rust'

alias svim='sudo vim'
alias spacman='sudo pacman'

alias mkchr='multilib-build'
alias offload='offload-build'

alias db-move-packages='ssh repos.archlinux.org /packages/db-move'
alias db-move-community='ssh repos.archlinux.org /community/db-move'
alias db-update-packages='ssh repos.archlinux.org /packages/db-update'
alias db-update-community='ssh repos.archlinux.org /community/db-update'

alias irc='ssh -C tank -t "tmux attach -t irc"'
alias weather='curl wttr.in'
alias moon='curl wttr.in/Moon'


# zoxide
source <(zoxide init zsh)


# ssh keys
eval $(keychain --eval --timeout 600 --agents ssh -Q --quiet --noask arch_rsa id_rsa skeletonkey_rsa)
alias auth='eval $(keychain --eval --timeout 600 --agents ssh -Q --quiet arch_rsa id_rsa skeletonkey_rsa)'


# fzf

# enables CTRL-T and CTRL-R fuzzy stuff
source /usr/share/fzf/key-bindings.zsh

# unbind ALT-C because we don't want that
bindkey -r '\ec'

# fdd - cd to selected directory
fdd() {
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
