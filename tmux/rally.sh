#!/bin/sh

set -eu

RALLY=rally
VERSION=0.0.1

TARGET=$(ls -d ~/Public/* ~/* /srv/* ~/Documents/* | fzf --header-first --header="Launch Project" --prompt="🔮 " --preview "exa --tree --icons --level 3 --git-ignore {}")
NAME=$(basename $TARGET)
SESSION_NAME=$(echo $NAME | tr [:lower:] [:upper:])

smug start $NAME -a 2>/dev/null || smug start default name=$SESSION_NAME root=$TARGET -a
