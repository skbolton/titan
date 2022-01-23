local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local wibox = require("wibox")
local dpi = xresources.apply_dpi
local helpers = require("helpers")

-- Child widgets
local time_text = wibox.widget {
    font = beautiful.font,
    format = "%l:%M %P",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
}

local time_icon = wibox.widget {
    font = beautiful.icon_font_name .. "12",
    markup = "<span foreground='" .. beautiful.xcolor5 .. "'></span>",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

time_text.markup = "<span foreground='" .. beautiful.xcolor5 .. "'>" ..
                       time_text.text .. "</span>"

-- Signals
time_text:connect_signal("widget::redraw_needed", function()
    time_text.markup = "<span foreground='" .. beautiful.xcolor5 .. "'>" ..
                           time_text.text .. "</span>"
end)

-- parent container
return wibox.widget {
    {
        {time_icon, top = dpi(1), widget = wibox.container.margin},
        {time_text, top = dpi(1), widget = wibox.container.margin},
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}


