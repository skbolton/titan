-- Programs to have running when awesomewm starts up
local awful = require("awful")

-- Daemons
awful.spawn.once("nitrogen --restore")
awful.spawn.once("picom --experimental-backends")
awful.spawn.once("synology-drive")
awful.spawn.once("playerctld daemon")
awful.spawn.once("nm-applet --no-agent")

-- GUIS
awful.spawn("kitty --class NNN zsh -c ~/.local/bin/nnn")
awful.spawn("kitty --class spotify-tui tmux start ';' attach -t spotify")
awful.spawn("kitty --class kitty-delta tmuxinator start Delta")
awful.spawn.once("mailspring")
awful.spawn.once("slack")


