#!/bin/bash

# Experimental fun script to automatically fix Arch Linux packages.
# This is probably cursed and I'm not sure anyone should be using this but it's also kinda fun
# Requires vmexec to be installed.

# shellcheck disable=SC2016

set -o nounset -o pipefail -o xtrace -o errexit

vmexec run \
  -e OPENCODE_CONFIG_CONTENT='{"permission": "allow"}' \
  -v "$PWD":/src \
  -v "$HOME"/.config/opencode:/root/.config/opencode \
  -v "$HOME"/.dotfiles/.dots/opencode:/root/.dotfiles/.dots/opencode:ro \
  -v "$HOME"/.local/share/opencode:/root/.local/share/opencode \
  -v "$HOME"/.local/state/opencode:/root/.local/state/opencode \
  --pmem /build:100 \
  --pmem /var/lib/archbuild:200 \
  --rm \
  --pull newer \
  --ssh-timeout 60 \
  archlinux -- \
    bash -c '
set -x
pacman -Sy --noconfirm opencode ripgrep base-devel devtools bat less htop kitty-terminfo pacman-contrib
useradd -m -p "" builder
echo "builder ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

cat > /tmp/prompt.md << EOF
You are an assistant for an Arch Linux packager.

Fix the PKGBUILD in the current directory so that it builds.
Use the script /tmp/run-build.sh to see whether it builds.
If you change a patch or any other files that are referenced by in the sources=() array, you need to run /usr/bin/updpkgsums to regenerate all the hashes.
Before starting your work, make sure you understand the PKGBUILD and any patches that might be getting applied.
This script will copy all files in the current dir to /build and will then build them using another user so that we can use pkgctl build. Do not modify the files in /build because it is a transient directory.
Set a really long timeout (at least 1h) when calling the build script as the package might take a long time to build.
If you notice that the build fails, there are multiple things you can do:
1. Change the build flags.
   For example, to ignore a warning, something like this could potentially work: export CXXFLAGS+=" -Wno-error=ignored-attributes" or like this export CFLAGS+=" -Wno-error=maybe-uninitialized"
2. Adding a patch by changing the upstream sources.
   You can often take the upstream code from the sources array, change it and then generate a patch using either "git diff" or "diff", depending on the situation.
   Add the resulting patch into the sources=() array with a descriptive unique name such as "$pkgname-add-cmake-option-zig-local.patch" and then call patch in prepare().
   IMPORTANT: Before coming up with your own patch, first search relevant upstreams projects on whether somebody has already posted a patch/merge request/pull request for the issue.
3. Consider changing something else in the PKGBUILD that might be incorrect.
4. Suggesting changing another Arch Linux package if you think it is necessary.
5. Suggest something else entirely.
EOF

cat > /tmp/run-build.sh << EOF
#!/bin/bash
cp -r /src/* /build
chown -R builder /build
cd /build
# Import upstream GPG keys
if [[ -d keys/pgp ]]; then
    sudo -u builder gpg --import keys/pgp/*.asc
fi
sudo -u builder pkgctl build
EOF

chmod +x /tmp/run-build.sh

cd /src
cp --remove-destination /root/.dotfiles/.dots/opencode/* /root/.config/opencode/
opencode --prompt "$(cat /tmp/prompt.md)"
'
