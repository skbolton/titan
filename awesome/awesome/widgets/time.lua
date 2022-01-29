local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local wibox = require("wibox")
local dpi = xresources.apply_dpi
local helpers = require("helpers")
local gfs = require("gears.filesystem")
local gc = require("gears.color")
local naughty = require("naughty")

naughty.notify({text = tostring(beautiful.purple)})

-- Child widgets
local time_text = wibox.widget {
    font = beautiful.font,
    format = "%l:%M %P",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
}

local time_icon = wibox.widget {
    image = gc.recolor_image(gfs.get_configuration_dir() .. "/icons/remix/time-line.svg", beautiful.purple),
    resize = true,
    widget = wibox.widget.imagebox
}

time_text.markup = "<span foreground='" .. beautiful.purple .. "'>" ..
                       time_text.text .. "</span>"

-- Signals
time_text:connect_signal("widget::redraw_needed", function()
    time_text.markup = "<span foreground='" .. beautiful.purple .. "'>" ..
                           time_text.text .. "</span>"
end)

-- parent container
return wibox.widget {
    {
        {
          time_icon,
          top = dpi(6),
          bottom = dpi(6),
          widget = wibox.container.margin
        },
        {time_text, top = dpi(1), widget = wibox.container.margin},
        spacing = dpi(8),
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}


