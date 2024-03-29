local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")
local arch = require("widgets.arch")
local time = require("widgets.time")
local date = require("widgets.date")
local battery_arc = require("widgets.battery_arc")
local playerctl_bar = require("widgets.player")
local yubikey = require("widgets.yubikey")
local taskwarrior = require("widgets.taskwarrior")

-- Systray Widget -------------------------------------------------------------

local mysystray = wibox.widget.systray()

-- Tasklist Buttons -----------------------------------------------------------

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


-- Create the Wibar -----------------------------------------------------------

local final_systray = wibox.widget {
    {
        mysystray,
        top = dpi(4),
        bottom = dpi(2),
        left = dpi(6),
        right = dpi(6),
        layout = wibox.container.margin
    },
    bg = beautiful.bg_dark,
    shape = helpers.rrect(10),
    widget = wibox.container.background
}

local wrap_widget = function(w)
    local wrapped = wibox.widget {
        w,
        top = dpi(5),
        left = dpi(4),
        bottom = dpi(5),
        right = dpi(4),
        widget = wibox.container.margin
    }
    return wrapped
end

local make_pill = function(w)
    return wibox.widget {
        w,
        bg = beautiful.bg_dark,
        shape = helpers.rrect(10),
        widget = wibox.container.background
    }
end

awful.screen.connect_for_each_screen(function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create layoutbox widget
    s.mylayoutbox = awful.widget.layoutbox(s)

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        type = "dock",
        ontop = true
    })

    -- Remove wibar on full screen
    local function remove_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibox.visible = false
        else
            c.screen.mywibox.visible = true
        end
    end

    -- Remove wibar on full screen
    local function add_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibox.visible = true
        end
    end

    -- Hide bar when a splash widget is visible
    awesome.connect_signal("widgets::splash::visibility", function(vis)
        screen.primary.mywibox.visible = not vis
    end)

    client.connect_signal("property::fullscreen", remove_wibar)

    client.connect_signal("request::unmanage", add_wibar)

    -- Create the taglist widget
    s.mytaglist = require("elemental.bar.tag_list")(s)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        bg = beautiful.wibar_bg,
        style = {bg = beautiful.bg_dark, shape = helpers.rrect(10)},
        layout = {
            spacing = dpi(10),
            spacing_widget = {
                bg = beautiful.bg_dark,
                widget = wibox.container.background
            },
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
          {
              {
                  {
                      {
                          id     = 'clienticon',
                          widget = awful.widget.clienticon,
                      },
                      top = dpi(1),
                      bottom = dpi(1),
                      right = dpi(1),
                      widget  = wibox.container.margin,
                  },
                  {
                    {
                      id = 'text_role',
                      widget = wibox.widget.textbox
                    },
                    width = 150,
                    widget = wibox.container.constraint
                  },
                  spacing = dpi(6),
                  layout = wibox.layout.fixed.horizontal,
              },
              top = dpi(5),
              right = dpi(10),
              bottom = dpi(5),
              left = dpi(10),
              widget = wibox.container.margin
          },
          id     = 'background_role',
          create_callback = function(self, c, index, objects) --luacheck: no unused args
            self:get_children_by_id('clienticon')[1].client = c
          end,
          widget = wibox.container.background,
        },
    }

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.vertical,
        nil,
        {
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                {
                    layout = wibox.layout.fixed.horizontal,
                    wrap_widget(make_pill(arch)),
                    wrap_widget(make_pill(
                                    {
                            s.mylayoutbox,
                            top = dpi(5),
                            bottom = dpi(5),
                            right = dpi(8),
                            left = dpi(8),
                            widget = wibox.container.margin
                        })),
                    wrap_widget(make_pill(s.mytaglist)),
                    s.mypromptbox,
                    wrap_widget(make_pill(playerctl_bar))
                },
                {wrap_widget(s.mytasklist), widget = wibox.container.constraint},
                {
                  wrap_widget(make_pill(wibox.widget {
                    helpers.horizontal_pad(6),
                    yubikey,
                    helpers.horizontal_pad(10),
                    battery_arc,
                    helpers.horizontal_pad(6),
                    layout = wibox.layout.fixed.horizontal
                  })),
                    wrap_widget(make_pill(taskwarrior)),
                    wrap_widget(make_pill(time)),
                    wrap_widget(make_pill(date)),
                    wrap_widget(awful.widget.only_on_screen(final_systray,
                                                            screen[1])),
                    helpers.horizontal_pad(4),
                    layout = wibox.layout.fixed.horizontal
                }
            },
            widget = wibox.container.background,
            bg = beautiful.wibar_bg_secondary
        },
        { -- This is for a bottom border in the bar
            widget = wibox.container.background,
            bg = beautiful.bg_dark,
            forced_height = beautiful.widget_border_width
        }
    }
end)

-- EOF ------------------------------------------------------------------------

