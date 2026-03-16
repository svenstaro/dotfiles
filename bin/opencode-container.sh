#!/bin/bash
# Build opencode container or run it with the current dir mounted.

containerfile="FROM archlinux:base-devel

RUN pacman -Syu --noconfirm --needed \
    opencode devtools \
    nodejs npm just git jujutsu \
    jq python uv \
    rust cargo-nextest sea-orm-cli rust-analyzer geckodriver

ENV TERM=xterm-256color
ENTRYPOINT opencode
"

cmd=$1

function build() {
  tmpcontainerfile=$(mktemp)
  echo "$containerfile" > "$tmpcontainerfile"
  podman build --tag opencode -f "$tmpcontainerfile"
}

function run() {
  podman run -it --rm --name opencode \
    -w /src \
    -v ./:/src \
    -v ~/.config/opencode:/root/.config/opencode \
    -v ~/.local/share/opencode:/root/.local/share/opencode \
    -v /home/svenstaro/.dotfiles/.dots/opencode:/home/svenstaro/.dotfiles/.dots/opencode:ro \
  localhost/opencode
}

if [[ $cmd == "build" ]]; then
  build
elif [[ $cmd == "run" ]]; then
  run
else
  run
fi
