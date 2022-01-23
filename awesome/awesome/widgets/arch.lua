local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gfs = require("gears.filesystem")
local gc = require("gears.color")

local icon = wibox.widget {
    widget = wibox.widget.imagebox,
    image = gc.recolor_image(gfs.get_configuration_dir() .. "/icons/remix/space-ship-fill.svg", beautiful.xcolor2),
}

return wibox.widget {
  icon,
  top = dpi(5),
  bottom = dpi(5),
  left = dpi(6),
  right = dpi(6),
  widget = wibox.container.margin
}

