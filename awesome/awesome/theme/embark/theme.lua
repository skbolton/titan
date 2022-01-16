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
local icon_path = gfs.get_configuration_dir() .. "icons/embark/"

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
theme.xbackground = embark.bg
theme.xforeground = embark.fg
theme.xcolor0 = embark.bg_dark
theme.xcolor1 = embark.red
theme.xcolor2 = embark.green
theme.xcolor3 = embark.yellow
theme.xcolor4 = embark.blue
theme.xcolor5 = embark.purple
theme.xcolor6 = embark.cyan
theme.xcolor7 = embark.fg
theme.xcolor8 = embark.bg_dark
theme.xcolor9 = embark.red_dark
theme.xcolor10 = embark.green_dark
theme.xcolor11 = embark.yellow_dark
theme.xcolor12 = embark.blue_dark
theme.xcolor13 = embark.purple_dark
theme.xcolor14 = embark.cyan_dark
theme.xcolor15 = embark.fg_dark

-- Fonts
--
theme.font_name = "Operator Mono "
theme.font = theme.font_name .. "10"
theme.icon_font_name = "RobotMono Nerd Font Mono "
theme.icon_font = theme.icon_font_name .. "18"
theme.font_taglist = theme.icon_font_name .. "13"

-- Background Colors
--
theme.bg_dark = theme.xcolor0
theme.bg_normal = theme.xbackground
theme.bg_focus = theme.xcolor0
theme.bg_urgent = theme.xcolor8
theme.bg_minimize = theme.xcolor8

-- Foreground Colors
--
theme.fg_normal = theme.xcolor7
theme.fg_focus = theme.xcolor4
theme.fg_urgent = theme.xcolor3
theme.fg_minimize = theme.xcolor8

theme.button_close = theme.xcolor1

-- uBorders
--
theme.border_width = dpi(2)
theme.oof_border_width = dpi(0)
theme.border_normal = theme.xcolor0
theme.border_focus = embark.cyan_dark
theme.border_radius = dpi(12)
theme.client_radius = dpi(12)
theme.widget_border_width = dpi(3)
theme.widget_border_color = theme.xcolor0

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
theme.taglist_bg_focus = theme.xcolor0
theme.taglist_fg_focus = theme.xcolor3
theme.taglist_bg_urgent = theme.xcolor0
theme.taglist_fg_urgent = theme.xcolor6
theme.taglist_bg_occupied = theme.xcolor0
theme.taglist_fg_occupied = theme.xcolor6
theme.taglist_bg_empty = theme.xcolor0
theme.taglist_fg_empty = theme.xcolor8
theme.taglist_bg_volatile = transparent
theme.taglist_fg_volatile = theme.xcolor11
theme.taglist_disable_icon = true
theme.taglist_shape_focus = helpers.rrect(theme.border_radius - 3)

-- Tasklist
--
theme.tasklist_font = theme.font
theme.tasklist_plain_task_name = true
theme.tasklist_bg_focus = theme.xcolor0
theme.tasklist_fg_focus = theme.xcolor6
theme.tasklist_bg_minimize = theme.xcolor0 .. 55
theme.tasklist_fg_minimize = theme.xforeground .. 55
theme.tasklist_bg_normal = theme.xcolor0 .. 70
theme.tasklist_fg_normal = theme.xforeground
theme.tasklist_disable_task_name = false
theme.tasklist_disable_icon = true
theme.tasklist_bg_urgent = theme.xcolor0
theme.tasklist_fg_urgent = theme.xcolor1
theme.tasklist_align = "center"

-- Titlebars
--
theme.titlebar_size = dpi(40)
theme.titlebar_height = dpi(20)
theme.titlebar_bg_focus = theme.xcolor8
theme.titlebar_bg_normal = theme.xcolor0
theme.titlebar_fg_normal = theme.xcolor8
theme.titlebar_fg_focus = theme.xcolor15 .. "55"

-- Edge snap
--
theme.snap_bg = theme.xcolor8
theme.snap_shape = helpers.rrect(0)

-- Prompts
--
theme.prompt_bg = transparent
theme.prompt_fg = theme.xforeground

-- Tooltips
--
theme.tooltip_bg = theme.xbackground
theme.tooltip_fg = theme.xforeground
theme.tooltip_font = theme.font_name .. "12"
theme.tooltip_border_width = theme.widget_border_width
theme.tooltip_border_color = theme.xcolor0
theme.tooltip_opacity = 1
theme.tooltip_align = "left"

-- Menu
--
theme.menu_font = theme.font
theme.menu_bg_focus = theme.xcolor4 .. 70
theme.menu_fg_focus = theme.xcolor7
theme.menu_bg_normal = theme.xbackground
theme.menu_fg_normal = theme.xcolor7
theme.menu_submenu_icon = gears.filesystem.get_configuration_dir() ..
                              "theme/icons/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width = dpi(130)
theme.menu_border_color = theme.xcolor8
theme.menu_border_width = theme.border_width / 2

-- Hotkeys Pop Up
--
theme.hotkeys_font = theme.font
theme.hotkeys_modifiers_fg = theme.xcolor2
theme.hotkeys_border_color = theme.xcolor0
theme.hotkeys_group_margin = dpi(40)
theme.hotkeys_shape = helpers.rrect(25)

-- Layout List
--
theme.layoutlist_border_color = theme.xcolor8
theme.layoutlist_border_width = theme.border_width
theme.layoutlist_shape_selected = gears.shape.squircle
theme.layoutlist_bg_selected = theme.xcolor8 .. 55

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.xforeground)

-- Gaps
--
theme.useless_gap = dpi(4)

-- Exit Screen
--
theme.exit_screen_fg = theme.xforeground
theme.exit_screen_bg = theme.xcolor0 .. "28"

-- Wibar
--
theme.wibar_height = dpi(36) + theme.widget_border_width
theme.wibar_margin = dpi(15)
theme.wibar_spacing = dpi(15)
theme.wibar_bg = theme.xcolor0
theme.wibar_bg_secondary = theme.xbackground
-- theme.xcolor0 .. 55

-- Systray
--
theme.systray_icon_spacing = dpi(10)
theme.bg_systray = theme.xcolor8

-- Collision
--
theme.collision_focus_bg = theme.xcolor8
theme.collision_focus_fg = theme.xcolor6
theme.collision_focus_shape = helpers.rrect(theme.border_radius)
theme.collision_focus_border_width = theme.border_width
theme.collision_focus_border_color = theme.border_normal

theme.collision_focus_bg_center = theme.xcolor8
theme.collision_shape_width = dpi(50)
theme.collision_shape_height = dpi(50)
theme.collision_focus_shape_center = gears.shape.circle

theme.collision_max_bg = theme.xbackground
theme.collision_max_fg = theme.xcolor8
theme.collision_max_shape = helpers.rrect(0)
theme.bg_urgent = theme.xcolor1

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
theme.collision_screen_bg = theme.xbackground
theme.collision_screen_fg = theme.xcolor4
theme.collision_screen_bg_focus = theme.xcolor8
theme.collision_screen_fg_focus = theme.xcolor4

-- Tabs
--
theme.mstab_bar_height = dpi(60)
theme.mstab_bar_padding = dpi(0)
theme.mstab_border_radius = dpi(6)
theme.tabbar_style = "boxes"
theme.tabbar_bg_focus = theme.xbackground
theme.tabbar_bg_normal = theme.xcolor0
theme.tabbar_fg_focus = theme.xcolor8
theme.tabbar_fg_normal = theme.xcolor15 .. "55"
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
theme.machi_switcher_border_color = theme.xcolor4
theme.machi_switcher_border_opacity = 0.25
theme.machi_editor_border_color = theme.xcolor1
theme.machi_editor_border_opacity = 0.25
theme.machi_editor_active_opacity = 0.25

-- Tag Preview
--
theme.tag_preview_widget_border_radius = dpi(10)
theme.tag_preview_client_border_radius = dpi(7)
theme.tag_preview_client_opacity = 0.5
theme.tag_preview_client_bg = theme.xcolor0
theme.tag_preview_client_border_color = theme.xcolor8
theme.tag_preview_client_border_width = dpi(3)
theme.tag_preview_widget_bg = theme.xbackground
theme.tag_preview_widget_border_color = theme.widget_border_color
theme.tag_preview_widget_border_width = theme.widget_border_width
theme.tag_preview_widget_margin = dpi(15)

theme.fade_duration = 250

theme.flash_focus_start_opacity = 0.7       -- the starting opacity
theme.flash_focus_step = 0.01               -- the step of animation

return theme

