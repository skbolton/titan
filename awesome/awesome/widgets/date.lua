local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")
local gfs = require("gears.filesystem")
local gc = require("gears.color")

local date_text = wibox.widget {
    font = beautiful.font,
    format = "%m/%d/%y",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock
}

date_text.markup = helpers.colorize_text(date_text.text, beautiful.yellow_dark)

date_text:connect_signal("widget::redraw_needed", function()
  date_text.markup = helpers.colorize_text(date_text.text, beautiful.yellow_dark)
end)

local date_icon = wibox.widget {
    image = gc.recolor_image(gfs.get_configuration_dir() .. "/icons/remix/calendar-event-line.svg", beautiful.yellow_dark),
    resize = true,
    widget = wibox.widget.imagebox
}

return wibox.widget {
    {
        {
          date_icon,
          top = dpi(6),
          bottom = dpi(6),
          widget = wibox.container.margin
        },
        {date_text, top = dpi(1), widget = wibox.container.margin},
        spacing = dpi(8),
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}
