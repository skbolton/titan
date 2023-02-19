#!/bin/sh

set -eu

RALLY=rally
VERSION=0.0.1

TARGET=$(ls -d ~/Public/* ~/* /srv/* ~/Documents/* | fzf --header-first --header="Launch Project" --prompt="📁 " --preview "exa --tree --icons --level 3 --git-ignore {}")
NAME=$(basename $TARGET)
SESSION_NAME=$(echo $NAME | tr [:lower:] [:upper:])

tmuxinator start $NAME || tmuxinator start default name=$SESSION_NAME root=$TARGET
