--  _   _
-- | |_| |__   ___ _ __ ___   ___
-- | __| '_ \ / _ \ '_ ` _ \ / _ \
-- | |_| | | |  __/ | | | | |  __/
--  \__|_| |_|\___|_| |_| |_|\___|
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gears = require("gears")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local helpers = require("helpers")

local embark = {
  bg = "#1e1c31",
  bg_dark = "#100E23",
  fg = "#cbe3e7",
  fg_dark = "#8A889D",
  red = "#F48FB1",
  red_dark = "#F02E6E",
  -- "#FFB8DA",
  green = "#A1EFD3",
  green_dark = "#62d196",
  -- "#BBFFEF",
  yellow = "#ffe6b3",
  yellow_dark = "#F2B482",
  -- "#FFFFDC",
  blue = "#91ddff",
  blue_dark = "#65b2ff",
  purple = "#d4bfff",
  purple_dark = "#a37acc",
  cyan = "#87DFEB",
  cyan_dark = "#63f2f1"
}

-- Inherit default theme
--
local theme = dofile(themes_path .. "default/theme.lua")

-- Titlebar icon path
--
local icon_path = gfs.get_configuration_dir() .. "/icons/remix/"

theme.layout_tile = icon_path .. "layout-2-line.svg"
theme.layout_tileleft = icon_path .. "layout-4-line.svg"
theme.layout_fairh = icon_path .. "layout-grid-line.svg"
theme.layout_fairv = icon_path .. "layout-grid-line.svg"
theme.layout_fullscreen = icon_path .. "fullscreen-line.svg"

-- PFP
--
theme.me = gears.surface.load_uncached(gfs.get_configuration_dir() ..
                                           "images/me.png")

-- Icons for Notif Center
--
theme.clear_icon = icon_path .. "notif-center/clear.png"
theme.clear_grey_icon = icon_path .. "notif-center/clear_grey.png"
theme.notification_icon = icon_path .. "notif-center/notification.png"
theme.delete_icon = icon_path .. "notif-center/delete.png"
theme.delete_grey_icon = icon_path .. "notif-center/delete_grey.png"

-- Load ~/.Xresources colors and set fallback colors
--
-- theme.bg = embark.bg
theme.bg = embark.bg
theme.fg = embark.fg
theme.bg_dark = embark.bg_dark
theme.red = embark.red
theme.green = embark.green
theme.yellow = embark.yellow
theme.blue = embark.blue
theme.purple = embark.purple
theme.cyan = embark.cyan
theme.red_dark = embark.red_dark
theme.green_dark = embark.green_dark
theme.yellow_dark = embark.yellow_dark
theme.blue_dark = embark.blue_dark
theme.purple_dark = embark.purple_dark
theme.cyan_dark = embark.cyan_dark
theme.fg_dark = embark.fg_dark

-- Fonts
--
theme.font_name = "Iosevka SS18 Medium "
theme.font = theme.font_name .. "10"
theme.icon_font_name = "RobotMono Nerd Font Mono "
theme.icon_font = theme.icon_font_name .. "18"
theme.font_taglist = theme.icon_font_name .. "13"

-- Background Colors
--
theme.bg_dark = theme.bg_dark
theme.bg_normal = theme.bg
theme.bg_focus = theme.bg_dark
theme.bg_urgent = theme.bg_dark
theme.bg_minimize = theme.bg_dark

-- Foreground Colors
--
theme.fg_normal = theme.fg
theme.fg_focus = theme.blue
theme.fg_urgent = theme.yellow
theme.fg_minimize = theme.bg_dark

theme.button_close = theme.red

-- uBorders
--
theme.border_width = dpi(2)
theme.oof_border_width = dpi(0)
theme.border_normal = theme.bg_dark
theme.border_focus = embark.cyan_dark
theme.border_radius = dpi(12)
theme.client_radius = dpi(12)
theme.widget_border_width = dpi(3)
theme.widget_border_color = theme.bg_dark

-- Taglist
--
-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
                                taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
                                  taglist_square_size, theme.fg_normal)
theme.taglist_font = theme.font_taglist
theme.taglist_bg = theme.wibar_bg
theme.taglist_bg_focus = theme.bg_dark
theme.taglist_fg_focus = theme.yellow
theme.taglist_bg_urgent = theme.bg_dark
theme.taglist_fg_urgent = theme.cyan
theme.taglist_bg_occupied = theme.bg_dark
theme.taglist_fg_occupied = theme.cyan
theme.taglist_bg_empty = theme.bg_dark
theme.taglist_fg_empty = theme.bg_dark
theme.taglist_bg_volatile = transparent
theme.taglist_fg_volatile = theme.red
theme.taglist_disable_icon = true
theme.taglist_shape_focus = helpers.rrect(theme.border_radius - 3)

-- Tasklist
--
theme.tasklist_font = theme.font
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = theme.bg_dark
theme.tasklist_fg_focus = theme.cyan
theme.tasklist_bg_minimize = theme.bg_dark .. 55
theme.tasklist_fg_minimize = theme.fg .. 55
theme.tasklist_bg_normal = theme.bg_dark .. 70
theme.tasklist_fg_normal = theme.fg
theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = true
theme.tasklist_bg_urgent = theme.bg_dark
theme.tasklist_fg_urgent = theme.red
theme.tasklist_align = "center"

-- Titlebars
--
theme.titlebar_size = dpi(40)
theme.titlebar_height = dpi(20)
theme.titlebar_bg_focus = theme.bg_dark
theme.titlebar_bg_normal = theme.bg_dark
theme.titlebar_fg_normal = theme.bg_dark
theme.titlebar_fg_focus = theme.fg .. "55"

-- Edge snap
--
theme.snap_bg = theme.bg_dark
theme.snap_shape = helpers.rrect(0)

-- Prompts
--
theme.prompt_bg = transparent
theme.prompt_fg = theme.fg

-- Tooltips
--
theme.tooltip_bg = theme.bg
theme.tooltip_fg = theme.fg
theme.tooltip_font = theme.font_name .. "12"
theme.tooltip_border_width = theme.widget_border_width
theme.tooltip_border_color = theme.bg_dark
theme.tooltip_opacity = 1
theme.tooltip_align = "left"

-- Menu
--
theme.menu_font = theme.font
theme.menu_bg_focus = theme.blue .. 70
theme.menu_fg_focus = theme.fg
theme.menu_bg_normal = theme.bg
theme.menu_fg_normal = theme.fg
theme.menu_submenu_icon = gears.filesystem.get_configuration_dir() ..
                              "theme/icons/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(130)
theme.menu_border_color = theme.bg_dark
theme.menu_border_width = theme.border_width / 2

-- Hotkeys Pop Up
--
theme.hotkeys_font = theme.font
theme.hotkeys_modifiers_fg = theme.green
theme.hotkeys_border_color = theme.bg_dark
theme.hotkeys_group_margin = dpi(40)
theme.hotkeys_shape = helpers.rrect(25)

-- Layout List
--
theme.layoutlist_border_color = theme.bg_dark
theme.layoutlist_border_width = theme.border_width
theme.layoutlist_shape_selected = gears.shape.squircle
theme.layoutlist_bg_selected = theme.bg_dark .. 55

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg)

-- Gaps
--
theme.useless_gap = dpi(4)

-- Exit Screen
--
theme.exit_screen_fg = theme.fg
theme.exit_screen_bg = theme.bg_dark .. "28"

-- Wibar
--
theme.wibar_height = dpi(36) + theme.widget_border_width
theme.wibar_margin = dpi(15)
theme.wibar_spacing = dpi(15)
theme.wibar_bg = theme.bg_dark
theme.wibar_bg_secondary = theme.bg
-- theme.bg_dark .. 55

-- Systray
--
theme.systray_icon_spacing = dpi(10)
theme.bg_systray = theme.bg_dark

-- Collision
--
theme.collision_focus_bg = theme.bg_dark
theme.collision_focus_fg = theme.cyan
theme.collision_focus_shape = helpers.rrect(theme.border_radius)
theme.collision_focus_border_width = theme.border_width
theme.collision_focus_border_color = theme.border_normal

theme.collision_focus_bg_center = theme.bg_dark
theme.collision_shape_width = dpi(50)
theme.collision_shape_height = dpi(50)
theme.collision_focus_shape_center = gears.shape.circle

theme.collision_max_bg = theme.bg
theme.collision_max_fg = theme.bg_dark
theme.collision_max_shape = helpers.rrect(0)
theme.bg_urgent = theme.red

theme.collision_resize_width = dpi(20)
theme.collision_resize_shape = theme.collision_focus_shape
theme.collision_resize_border_width = theme.collision_focus_border_width
theme.collision_resize_border_color = theme.collision_focus_border_color
theme.collision_resize_padding = dpi(5)
theme.collision_resize_bg = theme.collision_focus_bg
theme.collision_resize_fg = theme.collision_focus_fg

theme.collision_screen_shape = theme.collision_focus_shape
theme.collision_screen_border_width = theme.collision_focus_border_width
theme.collision_screen_border_color = theme.collision_focus_border_color
theme.collision_screen_padding = dpi(5)
theme.collision_screen_bg = theme.bg
theme.collision_screen_fg = theme.blue
theme.collision_screen_bg_focus = theme.bg_dark
theme.collision_screen_fg_focus = theme.blue

-- Tabs
--
theme.mstab_bar_height = dpi(60)
theme.mstab_bar_padding = dpi(0)
theme.mstab_border_radius = dpi(6)
theme.tabbar_style = "boxes"
theme.tabbar_bg_focus = theme.bg
theme.tabbar_bg_normal = theme.bg_dark
theme.tabbar_fg_focus = theme.bg_dark
theme.tabbar_fg_normal = theme.fg .. "55"
theme.tabbar_position = "left"
theme.tabbar_AA_radius = 0
theme.tabbar_size = 40
theme.mstab_bar_ontop = true

theme.notification_spacing = 10
theme.notif_border_radius = dpi(10)
theme.notif_border_width = dpi(3)
theme.notification_icon_size = 75 
theme.notification_max_width = 500
theme.notification_max_height = 300

-- Weather
--
theme.weather_city = "San_Diego"

-- Swallowing
--
theme.dont_swallow_classname_list = {
    "firefox", "gimp", "Google-chrome", "Thunar"
}

-- Layout Machi
--
theme.machi_switcher_border_color = theme.blue
theme.machi_switcher_border_opacity = 0.25
theme.machi_editor_border_color = theme.red
theme.machi_editor_border_opacity = 0.25
theme.machi_editor_active_opacity = 0.25

-- Tag Preview
--
theme.tag_preview_widget_border_radius = dpi(10)
theme.tag_preview_client_border_radius = dpi(7)
theme.tag_preview_client_opacity = 0.5
theme.tag_preview_client_bg = theme.bg_dark
theme.tag_preview_client_border_color = theme.bg_dark
theme.tag_preview_client_border_width = dpi(3)
theme.tag_preview_widget_bg = theme.bg
theme.tag_preview_widget_border_color = theme.widget_border_color
theme.tag_preview_widget_border_width = theme.widget_border_width
theme.tag_preview_widget_margin = dpi(15)

theme.fade_duration = 250

theme.flash_focus_start_opacity = 0.7       -- the starting opacity
theme.flash_focus_step = 0.01               -- the step of animation

return theme

