-- Programs to have running when awesomewm starts up
local awful = require("awful")

-- Daemons
awful.spawn.once("nitrogen --restore")
awful.spawn.once("picom --experimental-backends")
awful.spawn.once("flatpak run com.synology.SynologyDrive")
awful.spawn.once("playerctld daemon")
awful.spawn.once("nm-applet --no-agent")
awful.spawn.once("blueman-applet")

-- GUIS
awful.spawn.once("mailspring")
awful.spawn.once("slack")


