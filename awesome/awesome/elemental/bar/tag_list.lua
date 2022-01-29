local awful = require("awful")
local gears = require("gears")
local helpers = require("helpers")
local gfs = gears.filesystem
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local naughty = require("naughty")

local selected_colors = {
  "#63F2F1",
  "#F2B482",
  "#d4bfff",
  "#91ddff",
  "#A1EFD3",
  "#FFE6B3"
}

local get_taglist = function(s)
    -- Taglist buttons
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

    -- Function to update the tags
    local update_tags = function(widget, tag)
        local imgbox = widget:get_children_by_id('icon_role')[1]
        local icon = tag.icon
        if tag.selected then
            imgbox.image = gears.color.recolor_image(icon, selected_colors[tag.index])
        elseif #tag:clients() == 0 then
            imgbox.image = gears.color.recolor_image(icon, "#585273")
        else
            imgbox.image = gears.color.recolor_image(icon, "#8A889D")
        end
    end

    local pac_taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        style = {shape = helpers.rrect(10)},
        layout = {spacing = 0, layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {
                {
                  id = 'icon_role',
                  widget = wibox.widget.imagebox
                },
                id = 'margin_role',
                top = dpi(6),
                bottom = dpi(6),
                left = dpi(10),
                right = dpi(10),
                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background,
            create_callback = function(self, c3, index, objects)
                update_tags(self, c3)
                self:connect_signal('mouse::enter', function()
                    if #c3:clients() > 0 then
                        awesome.emit_signal("bling::tag_preview::update", c3)
                        awesome.emit_signal("bling::tag_preview::visibility", s,
                                            true)
                    end
                    if self.bg ~= beautiful.xbackground .. "60" then
                        self.backup = self.bg
                        self.has_backup = true
                    end
                    self.bg = beautiful.xbackground .. "60"
                end)
                self:connect_signal('mouse::leave', function()
                    awesome.emit_signal("bling::tag_preview::visibility", s,
                                        false)
                    if self.has_backup then
                        self.bg = self.backup
                    end
                end)
            end,
            update_callback = function(self, c3, index, objects)
                update_tags(self, c3)
            end
        },
        buttons = taglist_buttons
    }

    return pac_taglist
end

return get_taglist

