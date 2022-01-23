local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local wibox = require("wibox")
local dpi = xresources.apply_dpi
local helpers = require("helpers")
local gfs = require("gears.filesystem")
local gc = require("gears.color")

local icon = gfs.get_configuration_dir() .. "/icons/remix/fingerprint-line.svg"
local white_icon = gc.recolor_image(icon, beautiful.xcolor7)
local green_icon = gc.recolor_image(icon, beautiful.xcolor2)

local yubikey = wibox.widget {
  image = white_icon,
  widget = wibox.widget.imagebox,
  resize = true,
}

awesome.connect_signal("demon::yubikey", function(event)
  if event == "start" then
    yubikey.image = green_icon
  else
    yubikey.image = white_icon
  end
end)

return wibox.widget {
  yubikey,
  top = dpi(6),
  bottom = dpi(6),
  widget = wibox.container.margin
}
