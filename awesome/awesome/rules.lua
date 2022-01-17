local awful = require("awful")
local keys = require("keys")
local beautiful = require("beautiful")

awful.rules.rules = {
    -- -- All clients will match this rule.
  { 
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = keys.clientkeys,
      buttons = keys.clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },
  { 
    rule_any = {
      class = {
        "firefox",
        "firefoxdeveloperedition"
      }
    },
    properties = { maximized = false, floating = false, tag = "2" }
  },
  {
    rule = {
      class = "NNN"
    },
    properties = { tag = "3" }
  },
  -- Chat applications
  {
    rule_any = {
      class = {
        "discord"
      }
    },
    properties = { tag = "4" }
  },
  {
    rule = {
      class = "Slack"
    },
    properties = {
      tags = {"4"}
    }
  },
  {
    rule = {
      class = "Mailspring"
    },
    properties = { tag = "7" }
  },
  {
    rule_any = {
      class = {
        "[Ss]potify",
        "spotify-tui"
      }
    },
    properties = { tag = "6" }
  },
  -- Notes and Planning
  {
    rule_any = {
      class = {
        "morgen",
        "obsidian",
        "Emacs",
        "kitty-delta"
      }
    },
    properties = { tag = "5" }
  },
  -- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA",  -- Firefox addon DownThemAll.
        "copyq",  -- Includes session name in class.
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin",  -- kalarm.
        "Sxiv",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester",  -- xev.
      },
      role = {
        "AlarmWindow",  -- Thunderbird's calendar.
        "ConfigManager",  -- Thunderbird's about:config.
        "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  },
    -- Remove titlebars to normal clients and dialogs
    -- {
    --   rule_any = {
    --     type = { "normal", "dialog" }
    --   },
    --   properties = { titlebars_enabled = false }
    -- }
}
