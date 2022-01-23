local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")

local date_text = wibox.widget {
    font = beautiful.font,
    format = "%m/%d/%y",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
}

date_text.markup = "<span foreground='" .. beautiful.xcolor11 .. "'>" ..
                       date_text.text .. "</span>"

date_text:connect_signal("widget::redraw_needed", function()
    date_text.markup = "<span foreground='" .. beautiful.xcolor11 .. "'>" ..
                           date_text.text .. "</span>"
end)

local date_icon = wibox.widget {
    font = beautiful.icon_font_name .. "12",
    markup = "<span foreground='" .. beautiful.xcolor11 .. "'> </span>",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

return wibox.widget {
    {
        {date_icon, top = dpi(1), widget = wibox.container.margin},
        {date_text, top = dpi(1), widget = wibox.container.margin},
        spacing = dpi(10),
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}
