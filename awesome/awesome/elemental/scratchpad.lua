local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local rubato = require("module.rubato")
local helpers = require("helpers")

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

local _M = {}

local terminal_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(600, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2

  local terminal = bling.module.scratchpad:new {
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

  awesome.connect_signal("scratch::terminal", function() terminal:toggle() end)

  return terminal
end

local monitor_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  local monitor = bling.module.scratchpad:new {
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

  awesome.connect_signal("scratch::monitor", function() monitor:toggle() end)

  return monitor
end


local bench_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  local bench = bling.module.scratchpad:new {
    command = "kitty --class kitty-bench -d '$HOME/Documents/Delta' nvim Bench.md",
    rule = {class = "kitty-bench"},
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = {x = x, y = y, height = height, width = width},
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = screen_geometry.height * 2
      }
    }
  }

  awesome.connect_signal("scratch::bench", function() bench:toggle() end)

  return bench
end

local quest_scratch = function(screen_geometry)
  local width = math.min(screen_geometry.width / 3, 1400)
  local height = screen_geometry.height * 0.90
  local x = (screen_geometry.width - width - 20) + screen_geometry.x
  local y = (screen_geometry.height - height) / 2

  local quest = bling.module.scratchpad:new{
      command = "kitty --class kitty-quest -d '$/home/orlando/Documents/Delta' --hold zk quest ", rule = {class = "kitty-quest"},
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

  awesome.connect_signal("scratch::quest", function() quest:toggle() end)

  return quest
end

local password_scratch = function(screen_geometry)
  -- clamp the width and height to always fit on screen
  local width = math.min(screen_geometry.width * 0.90, 2400)
  local height = math.min(1000, screen_geometry.height - 20)
  local x = (screen_geometry.width - width) / 2
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  local op = bling.module.scratchpad:new {
    command = "1password",
    rule = {class = "1password"},
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = {x = x, y = y, height = height, width = width},
    reapply = true,
    rubato = {
      y = rubato_with_defaults {
        pos = screen_geometry.height * 2
      }
    }
  }

  awesome.connect_signal("scratch::password", function() op:toggle() end)

  return op
end

local task_scratch = function(screen_geometry)
  local width = math.min(screen_geometry.width / 3, 1400)
  local height = screen_geometry.height * 0.90
  local x = 20
  local y = ((screen_geometry.height - height) / 2) + screen_geometry.y

  local task = bling.module.scratchpad:new{
      command = "kitty --class kitty-tasks --hold",
      rule = {class = "kitty-tasks"},
      sticky = false,
      autoclose = false,
      floating = true,
      geometry = {x = x, y = y, height = height, width = width},
      reapply = true,
      rubato = {
        y = rubato_with_defaults {
          pos = height + screen_geometry.height
        }
      }
  }

  awesome.connect_signal("scratch::tasks", function() task:toggle() end)

  return task
end


-- initialize scratchpads
_M.init = function()
    local scratchpads = {
      terminal_scratch,
      monitor_scratch,
      bench_scratch,
      quest_scratch,
      password_scratch,
      task_scratch
    }

    for _idx, scratch in pairs(scratchpads) do
      scratch(screen.primary.geometry)
    end
end

return _M

