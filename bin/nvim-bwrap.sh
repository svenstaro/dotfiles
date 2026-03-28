#!/bin/bash

bwrap \
    --unshare-all \
    --share-net \
    --die-with-parent \
    \
    {#- Basic filesystem structure #}
    --symlink usr/lib /lib \
    --symlink usr/lib /lib64 \
    --symlink usr/bin /bin \
    --symlink usr/bin /sbin \
    --ro-bind /usr/lib /usr/lib \
    --ro-bind /usr/bin /usr/bin \
    --ro-bind /usr/include /usr/include \
    --ro-bind /usr/share /usr/share \
    --proc /proc \
    --dev /dev \
    --tmpfs /tmp \
    --tmpfs /var/tmp \
    --tmpfs /run \
    --dir "$XDG_RUNTIME_DIR" \
    \
    {#- Minimal /etc files #}
    --ro-bind /etc/resolv.conf /etc/resolv.conf \
    --ro-bind /etc/hosts /etc/hosts \
    --ro-bind /etc/nsswitch.conf /etc/nsswitch.conf \
    --ro-bind /etc/passwd /etc/passwd \
    --ro-bind /etc/group /etc/group \
    --ro-bind /etc/localtime /etc/localtime \
    \
    {#- SSL certificates for API access #}
    --ro-bind /etc/ssl /etc/ssl \
    --ro-bind-try /etc/ca-certificates /etc/ca-certificates \
    \
    {#- Dev setup #}
    --ro-bind "$HOME/.rustup" "$HOME/.rustup" \
    \
    {#- neovim config and cache directories #}
    --bind-try "$HOME/.cache/nvim" "$HOME/.cache/nvim" \
    --bind-try "$HOME/.local/share/nvim" "$HOME/.local/share/nvim" \
    --bind-try "$HOME/.local/state/nvim" "$HOME/.local/state/nvim" \
    --bind-try "$HOME/.config/nvim" "$HOME/.config/nvim" \
    \
    {#- Mount current dir read-write #}
    --dir "$PWD" \
    --bind "$PWD" "$PWD" \
    --chdir "$PWD" \
    nvim "$@"
