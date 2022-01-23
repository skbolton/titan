local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local wibox = require("wibox")
local dpi = xresources.apply_dpi
local helpers = require("helpers")
local gfs = require("gears.filesystem")
local gc = require("gears.color")

local context_text = wibox.widget {
  font = beautiful.font,
  text = "--",
  widget = wibox.widget.textbox
}

awesome.connect_signal("tw::context", function(context)
  if context:gsub("%s+", "") == "" then
    context_text.text = "--"
  else
    context_text.text = context
  end
end)

local completed_text = wibox.widget {
  font = beautiful.font,
  text = "0",
  widget = wibox.widget.textbox
}

local completed_icon = wibox.widget {
  image = gc.recolor_image(gfs.get_configuration_dir() .. "/icons/remix/checkbox-circle-fill.svg", beautiful.xcolor4),
  resize = true,
  widget = wibox.widget.imagebox
}

awesome.connect_signal("tw::completed", function(count)
  completed_text.text = count
end)

local due_text = wibox.widget {
  font = beautiful.font,
  text = "0",
  widget = wibox.widget.textbox
}

awesome.connect_signal("tw::due", function(count)
  due_text.text = count
end)

local due_text = wibox.widget {
  font = beautiful.font,
  text = "0",
  widget = wibox.widget.textbox
}

local due_icon = wibox.widget {
  image = gc.recolor_image(gfs.get_configuration_dir() .. "/icons/remix/checkbox-circle-line.svg", beautiful.xcolor3),
  resize = true,
  widget = wibox.widget.imagebox
}

awesome.connect_signal("tw::due", function(count)
  due_text.text = count
end)

local overdue_text = wibox.widget {
  font = beautiful.font,
  text = "0",
  widget = wibox.widget.textbox
}

local overdue_icon = wibox.widget {
  image = gc.recolor_image(gfs.get_configuration_dir() .. "/icons/remix/alarm-warning-line.svg", beautiful.xcolor1),
  resize = true,
  widget = wibox.widget.imagebox
}

awesome.connect_signal("tw::overdue", function(count)
  overdue_text.text = count
end)

return wibox.widget {
  {
    {
      context_text,
      top = dpi(6),
      bottom = dpi(6),
      widget = wibox.container.margin
    },
    {
      completed_icon,
      top = dpi(6),
      bottom = dpi(6),
      widget = wibox.container.margin
    },
    {
      completed_text,
      top = dpi(6),
      bottom = dpi(6),
      widget = wibox.container.margin
    },
    layout = wibox.layout.fixed.horizontal,
    {
      due_icon,
      top = dpi(6),
      bottom = dpi(6),
      widget = wibox.container.margin
    },
    {
      due_text,
      top = dpi(6),
      bottom = dpi(6),
      widget = wibox.container.margin
    },
    {
      overdue_icon,
      top = dpi(6),
      bottom = dpi(6),
      widget = wibox.container.margin
    },
    {
      overdue_text,
      top = dpi(6),
      bottom = dpi(6),
      widget = wibox.container.margin
    },
    spacing = dpi(10),
    layout = wibox.layout.fixed.horizontal
  },
  left = dpi(8),
  right = dpi(8),
  widget = wibox.container.margin
}
