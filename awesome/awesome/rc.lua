--[[
░█▀█░█░█░█▀▀░█▀▀░█▀█░█▄█░█▀▀░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀
░█▀█░█▄█░█▀▀░▀▀█░█░█░█░█░█▀▀░░░█░░░█░█░█░█░█▀▀░░█░░█░█
░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀
--]]

-- IMPORTS
-- =======================================================
-- Awesome libs
local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local naughty = require("naughty")
local bling = require("module.bling")

bling.signal.playerctl.lib {
  player = {'spotify', 'spotifyd', '%any'}
}

local themes = {
  "embark" -- 1
}
-- set theme choice
local theme = themes[1]

local icon_themes = {
  "remix" -- 1
}
-- select icon theme
local icon = icon_themes[1]

local bar_themes = {
  "pillbar" -- 1
}
-- select bar theme
local bar = bar_themes[1]

-- Initialization
-- =======================================================
-- Theme handling
-- a lot of things need the theme to be properly configured so we need to do this very early in 
-- startup process
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/" .. theme .. "/theme.lua")

-- UI elements
require("elemental.bar." .. bar)
require("elemental.scratchpad").init()
require("elemental.notifs")
require("demons")

-- Configuration and preferences
require("keys").init()
require("rules")
require("signals")
require("autostart")

user = {
  terminal = "kitty"
}
-- TODO: Move this to its own module? (tag.lua)
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile.left,
  awful.layout.suit.tile,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  -- awful.layout.suit.spiral,
  -- awful.layout.suit.spiral.dwindle,
  awful.layout.suit.max,
  awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
  awful.layout.suit.floating,
  bling.layout.centered,
  -- awful.layout.suit.corner.nw,
  -- awful.layout.suit.corner.ne,
  -- awful.layout.suit.corner.sw,
  -- awful.layout.suit.corner.se,
}
-- }}}

awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    -- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    awful.tag.add("1", {
      icon = gears.filesystem.get_configuration_dir() .. "icons/" .. icon .. "/checkbox-blank-circle-line.svg",
      layout = awful.layout.layouts[1],
      master_fill_policy = "expand",
      gap_single_client = true,
      gap = beautiful.useless_gap,
      screen = s,
      selected = true
    })

    awful.tag.add("2", {
      icon = gears.filesystem.get_configuration_dir() .. "icons/" .. icon .. "/checkbox-blank-circle-line.svg",
      layout = awful.layout.layouts[1],
      master_fill_policy = "expand",
      gap_single_client = true,
      gap = beautiful.useless_gap,
      screen = s,
      selected = false
    })

    awful.tag.add("3", {
      icon = gears.filesystem.get_configuration_dir() .. "icons/" .. icon .. "/checkbox-blank-circle-line.svg",
      layout = awful.layout.layouts[1],
      master_fill_policy = "expand",
      gap_single_client = true,
      gap = beautiful.useless_gap,
      screen = s,
      selected = false
    })

    awful.tag.add("4", {
      icon = gears.filesystem.get_configuration_dir() .. "icons/" .. icon .. "/checkbox-blank-circle-line.svg",
      layout = awful.layout.layouts[1],
      master_fill_policy = "expand",
      gap_single_client = true,
      gap = beautiful.useless_gap,
      screen = s,
      selected = false
    })

    awful.tag.add("5", {
      icon = gears.filesystem.get_configuration_dir() .. "icons/" .. icon .. "/checkbox-blank-circle-line.svg",
      layout = awful.layout.layouts[1],
      master_fill_policy = "expand",
      gap_single_client = true,
      gap = beautiful.useless_gap,
      screen = s,
      selected = false
    })

    awful.tag.add("6", {
      icon = gears.filesystem.get_configuration_dir() .. "icons/" .. icon .. "/checkbox-blank-circle-line.svg",
      layout = awful.layout.layouts[1],
      master_fill_policy = "expand",
      gap_single_client = true,
      gap = beautiful.useless_gap,
      screen = s,
      selected = false
    })
end)

client.connect_signal("property::urgent", function(c)
    if c.class == 'firefox' or c.class == 'firefoxdeveloperedition' then
      c.minimized = false
      c:jump_to()
    end
end)

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

