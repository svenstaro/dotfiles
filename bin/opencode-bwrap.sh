#!/bin/bash

# I considered also using --new-session but it seems safe to not provide this
# since recent versions of linux.
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
    --dev-bind /dev/kvm /dev/kvm \
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
    --ro-bind "$HOME/.cache/vmexec" "$HOME/.cache/vmexec" \
    \
    {#- OpenCode config and cache directories #}
    --bind-try "$HOME/.cache/opencode" "$HOME/.cache/opencode" \
    --bind-try "$HOME/.local/share/opencode" "$HOME/.local/share/opencode" \
    --bind-try "$HOME/.local/state/opencode" "$HOME/.local/state/opencode" \
    --bind-try "$HOME/.config/opencode" "$HOME/.config/opencode" \
    \
    {#- Mount current dir read-write #}
    --dir "$PWD" \
    --bind "$PWD" "$PWD" \
    --chdir "$PWD" \
    opencode "$@"
