local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")
local arch = require("widgets.arch")
local gfs = require("gears.filesystem")

local me = wibox.widget {
  image = "/home/orlando/.face",
  widget = wibox.widget.imagebox,
  buttons = gears.table.join(
    awful.button({}, 1, function()
      awful.spawn(os.getenv("HOME") .. "/.config/polybar/scripts/powermenu")
    end)
  )
}

local cog = wibox.widget {
  image = gears.color.recolor_image(gfs.get_configuration_dir() .. "/icons/hero/cog.svg", beautiful.fg_dark),
  widget = wibox.widget.imagebox
}

local update_tags = function(widget, tag)
    local imgbox = widget:get_children_by_id('icon_role')[1]
    local icon = tag.icon
    imgbox.image = gears.color.recolor_image(icon, beautiful.fg)
    if tag.selected then
      imgbox.image = gears.color.recolor_image(icon, beautiful.green)
    elseif #tag:clients() == 0 then
      imgbox.image = gears.color.recolor_image(icon, beautiful.fg_dark)
    else
      imgbox.image = gears.color.recolor_image(icon, beautiful.fg)
    end
end

  local taglist_buttons = gears.table.join(
                              awful.button({}, 1,
                                           function(t) t:view_only() end),
                              awful.button({modkey}, 1, function(t)
          if client.focus then client.focus:move_to_tag(t) end
      end), awful.button({}, 3, awful.tag.viewtoggle),
                              awful.button({modkey}, 3, function(t)
          if client.focus then client.focus:toggle_tag(t) end
      end), awful.button({}, 4, function(t)
          awful.tag.viewnext(t.screen)
      end), awful.button({}, 5, function(t)
          awful.tag.viewprev(t.screen)
      end))

local taglist = function(s)
  return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    layout = {spacing = dpi(12), layout = wibox.layout.fixed.vertical},
    widget_template = {
      {
        id = 'icon_role',
        widget = wibox.widget.imagebox
      },
      margins = dpi(12),
      id = 'margin_role',
      widget = wibox.container.margin,
      create_callback = function(self, c3, index, objects)
          update_tags(self, c3)
      end,
      update_callback = function(self, c3, index, objects)
          update_tags(self, c3)
      end
    },
    buttons = taglist_buttons
  }
end

local tasklist_buttons = gears.table.join(
                           awful.button({}, 1, function(c)
      if c == client.focus then
          c.minimized = true
      else
          c:emit_signal("request::activate", "tasklist", {raise = true})
      end
  end), awful.button({}, 3, function()
      awful.menu.client_list({theme = {width = 250}})
  end), awful.button({}, 4, function() awful.client.focus.byidx(1) end),
                           awful.button({}, 5, function()
      awful.client.focus.byidx(-1)
  end))


local tasklist = function(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    style = {bg = beautiful.bg_dark, shape = helpers.rrect(10)},
    layout = { spacing = dpi(2), layout = wibox.layout.fixed.vertical },
    widget_template = {
      {
        id     = 'clienticon',
        widget = awful.widget.clienticon,
      },
      id = 'margin_role',
      widget = wibox.container.margin,
      create_callback = function(self, c, index, objects) --luacheck: no unused args
        self:get_children_by_id('clienticon')[1].client = c
        local margin = self:get_children_by_id('margin_role')[1]
        if c.minimized then
          margin.margins = dpi(12)
        else
          margin.margins = dpi(8)
        end
      end,
      update_callback = function(self, c, index, objects)
        self:get_children_by_id('clienticon')[1].client = c
        local margin = self:get_children_by_id('margin_role')[1]
        if c.minimized then
          margin.margins = dpi(16)
        else
          margin.margins = dpi(12)
        end
      end
    }
  }
end

awful.screen.connect_for_each_screen(function(s)
  s.mywibox = awful.wibar {
    position = "left",
    screen = s,
    type = "dock",
    ontop = true,
    bg = beautiful.bg_dark,
    width = dpi(42),
  }

  s.mywibox:setup {
    layout = wibox.layout.align.vertical,
    expand = "none",
    {
      taglist(s),
      top = dpi(8),
      widget = wibox.container.margin
    },
    tasklist(s),
    {
      {
        {
          {
            {
              format = "<span foreground='" .. beautiful.purple .."'>%I:%M</span>" ,
              widget = wibox.widget.textclock
            },
            left = dpi(5),
            right = dpi(5),
            top = dpi(2),
            bottom = dpi(2),
            widget = wibox.container.margin
          },
          {
            {
              format = "%m-%d",
              widget = wibox.widget.textclock
            },
            left = dpi(5),
            right = dpi(5),
            top = dpi(2),
            bottom = dpi(2),
            widget = wibox.container.margin
          },
          {
            cog,
            margins = dpi(12),
            widget = wibox.container.margin
          },
          layout = wibox.layout.align.vertical
        },
        {
          me,
          margins = dpi(8),
          widget = wibox.container.margin
        },
        nil,
        widget = wibox.layout.align.vertical
      },
      bottom = dpi(8),
      widget = wibox.container.margin
    }
  }
end)
