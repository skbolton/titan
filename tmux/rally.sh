#!/bin/sh

set -eu

RALLY=rally
VERSION=0.0.1

TARGET=$(ls -d ~/Repos/* ~/* /srv/* ~/Documents/Archive/Finances/* | sk)
NAME=$(basename $TARGET)

smug start $NAME -a || smug start default -a name=$NAME root=$TARGET
