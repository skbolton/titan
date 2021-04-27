#!/bin/sh

set -eu

RALLY=rally
VERSION=0.0.1

TARGET=$(ls -d ~/Repos/* ~/* | sk)
NAME=$(basename $TARGET)

tmuxinator start $NAME || tmuxinator start launch name=$NAME root=$TARGET
