local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local bling = require("module.bling")
local playerctl = bling.signal.playerctl.lib()
local naughty = require("naughty")
-- Playerctl Bar Widget -------------------------------------------------------

-- Title Widget
local song_title = wibox.widget {
    markup = "",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local song_artist = wibox.widget {
    markup = "",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local song_logo = wibox.widget {
    markup = helpers.colorize_text(' ', beautiful.cyan),
    font = beautiful.icon_font_name .. 12,
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

local playerctl_bar = wibox.widget {
    {
        {
            song_logo,
            top = dpi(3),
            left = dpi(3),
            right = dpi(0),
            bottom = dpi(1),
            widget = wibox.container.margin
        },
        {
            {
                song_title,
                expand = "outside",
                layout = wibox.layout.align.vertical
            },
            top = dpi(1),
            left = dpi(10),
            right = dpi(10),
            widget = wibox.container.margin
        },
        {
            {
                song_artist,
                expand = "outside",
                layout = wibox.layout.align.vertical
            },
            top = dpi(1),
            left = dpi(10),
            widget = wibox.container.margin
        },
        spacing = 1,
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(13),
    widget = wibox.container.margin
}

playerctl_bar.visible = false

-- Connect signals to widgets
playerctl:connect_signal("metadata", function(_, title, artist)
  -- only show player bar if actual music is playing
  if title ~= "" and artist ~= "" then
    playerctl_bar.visible = true
    song_title.markup = helpers.colorize_text(title, beautiful.purple)
    song_artist.markup = helpers.colorize_text(artist, beautiful.blue)
  end
end)

playerctl:connect_signal("no_players",
                       function() playerctl_bar.visible = false end)


return playerctl_bar
