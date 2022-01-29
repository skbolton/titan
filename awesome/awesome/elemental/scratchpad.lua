local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local rubato = require("module.rubato")
local helpers = require("helpers")
local naughty = require("naughty")

local _M = { last_focused_client = nil }

local rubato_with_defaults = function(overrides)
  return rubato.timed {
    pos = overrides.pos or 0,
    rate = overrides.rate or 120,
    easing = overrides.easing or rubato.quadratic,
    intro = overrides.intro or 0.1,
    duration = overrides.duration or 0.4,
    awestore_compat = true
  }
end

local terminal_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(600, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2

  return bling.module.scratchpad:new {
    command = "kitty --class kitty-scratch --hold",
    rule = {class = "kitty-scratch"},
    sticky = true,
    autoclose = false,
    geometry = {x = x, y = dpi(60) + screen_geometry.y, height = height, width = width},
    floating = true,
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = -height
      }
    }
  }
end

local finance_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  return bling.module.scratchpad:new {
    command = "kitty --class kitty-finance nvim ~/Documents/Delta/journal.beancount",
    rule = {class = "kitty-finance"},
    sticky = true,
    autoclose = false,
    geometry = {x = x, y = y, height = height, width = width},
    floating = true,
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = -height
      }
    }
  }
end

local monitor_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  return bling.module.scratchpad:new {
    command = "kitty --class kitty-monitor bpytop",
    rule = {class = "kitty-monitor"},
    sticky = true,
    autoclose = false,
    geometry = {x = x, y = y, height = height, width = width},
    floating = true,
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = -height
      }
    }
  }
end


local bench_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  return bling.module.scratchpad:new {
    command = "kitty --class kitty-bench -d '$HOME/Documents/Delta' nvim Bench.md",
    rule = {class = "kitty-bench"},
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = {x = x, y = y, height = height, width = width},
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = -height
      }
    }
  }
end

local quest_scratch = function(screen_geometry)
  local width = math.min(screen_geometry.width / 3, 1400)
  local height = screen_geometry.height * 0.90
  local x = (screen_geometry.width - width - 20) + screen_geometry.x
  local y = (screen_geometry.height - height) / 2

  return bling.module.scratchpad:new{
      command = "kitty --class kitty-quest -d '$/home/{{ grains['user'] }}/Documents/Delta' --hold zk quest ", rule = {class = "kitty-quest"},
      sticky = false,
      autoclose = false,
      floating = true,
      geometry = {x = x, y = y, height = height, width = width},
      reapply = true,
      rubato = {
        x = rubato_with_defaults {
          pos = screen_geometry.width + width + screen_geometry.x
        }
      }
  }
end

local password_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  return bling.module.scratchpad:new {
    command = "1password",
    rule = {class = "1password"},
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = {x = x, y = y, height = height, width = width},
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = -height
      }
    }
  }
end

local task_scratch = function(screen_geometry)
  local width = math.max(screen_geometry.width / 3, 1200)
  local height = screen_geometry.height * 0.90
  local x = 20
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  return bling.module.scratchpad:new{
      command = "kitty --class kitty-tasks --hold",
      rule = {class = "kitty-tasks"},
      sticky = false,
      autoclose = false,
      floating = true,
      geometry = {x = x, y = y, height = height, width = width},
      reapply = true,
      rubato = {
        y = rubato_with_defaults {
          pos = -height
        }
      }
  }
end

local ticket_scratch = function(screen_geometry)
  local width = math.max(screen_geometry.width / 3, 1200)
  local height = screen_geometry.height * 0.90
  local x = screen_geometry.width - width - 20
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  return bling.module.scratchpad:new{
      command = "kitty --class kitty-ticket current-ticket.sh",
      rule = {class = "kitty-ticket"},
      sticky = false,
      autoclose = false,
      floating = true,
      geometry = {x = x, y = y, height = height, width = width},
      reapply = true,
      rubato = {
        x = rubato_with_defaults {
          pos = screen_geometry.width
        }
      }
  }
end


-- initialize scratchpads
_M.init = function()
    local scratchpads = {
      terminal = terminal_scratch,
      monitor = monitor_scratch,
      bench = bench_scratch,
      quest = quest_scratch,
      password = password_scratch,
      task = task_scratch,
      finance = finance_scratch,
      ticket = ticket_scratch
    }

    for name, scratch in pairs(scratchpads) do
      _M[name] = scratch(screen.primary.geometry)
    end
end

return _M

