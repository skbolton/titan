#! /usr/bin/env bash

# Author:       Arturo Aguilar Lagunas
# Date:         30/08/2021
# Description:  Collection of conky themes uncomment lines
#               in order to launch the desired theme

# Path to directory containing conky themes
themes_path=$HOME/.config/conky/themes

# Kill all conky processess
killall conky
sleep 1

# minimal (clear)
conky -c $themes_path/minimal-clear/dark-minimal-clear.conf
