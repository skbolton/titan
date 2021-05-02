#!/bin/sh

set -eu

RALLY=rally
VERSION=0.0.1

TARGET=$(ls -d ~/Repos/* ~/* | sk)
NAME=$(basename $TARGET)

smug start $NAME -a || smug start launch -a name=$NAME root=$TARGET
