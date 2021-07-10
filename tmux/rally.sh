#!/bin/sh

set -eu

RALLY=rally
VERSION=0.0.1

TARGET=$(ls -d ~/Repos/* ~/* /srv/* ~/Documents/* | sk)
NAME=$(basename $TARGET)

tmuxinator start $NAME || tmuxinator start default name=$NAME root=$TARGET
