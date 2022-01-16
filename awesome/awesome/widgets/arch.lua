local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local icon = wibox.widget {
    widget = wibox.widget.textbox,
    markup = "<span color='#A1EFD3'> </span>",
    font = beautiful.icon_font
}

return wibox.widget {
    {
        icon,
        top = dpi(5),
        bottom = dpi(5),
        left = dpi(10),
        right = dpi(5),
        widget = wibox.container.margin
    },
    bg = beautiful.xcolor0,
    widget = wibox.container.background
}

