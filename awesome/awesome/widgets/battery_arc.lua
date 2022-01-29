local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi

local battery_arc = wibox.widget {
  max_value = 100,
  rounded_edge = true,
  start_angle = 4.71238898, -- 2pi*3/4
  thickness = 3,
  forced_height = dpi(12),
  forced_width = dpi(12),
  widget = wibox.container.arcchart
}

awesome.connect_signal("demon::battery", function(value)
    if (value >= 30) then
      battery_arc.colors = {beautiful.green}
    elseif (value > 10) then
      battery_arc.colors = {beautiful.yellow}
    else
      battery_arc.colors = {beautiful.red}
    end
    battery_arc.value = value
end)

return battery_arc
