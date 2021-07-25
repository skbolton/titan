-- Programs to have running when awesomewm starts up
local awful = require("awful")

-- Daemons
awful.spawn.once("nitrogen --restore")
awful.spawn.once("picom --experimental-backends")
awful.spawn.once("synology-drive")
awful.spawn.once("playerctld daemon")

-- GUIS
awful.spawn.once("mailspring")
awful.spawn.once("slack")


