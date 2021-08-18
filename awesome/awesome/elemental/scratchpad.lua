local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local awestore = require("awestore")
local helpers = require("helpers")

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
    geometry = {x = x, y = dpi(60), height = height, width = width},
    floating = true,
    reapply = true,
    awestore = {
      y = awestore.tweened(-height, { duration = 300, easing = awestore.easing.cubic_in_out })
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
  local y = (screen_geometry.height - height) / 2

  local monitor = bling.module.scratchpad:new {
    command = "kitty --class kitty-monitor bpytop",
    rule = {class = "kitty-monitor"},
    sticky = true,
    autoclose = false,
    geometry = {x = x, y = y, height = height, width = width},
    floating = true,
    reapply = true,
    awestore = {
      y = awestore.tweened(-height, { duration = 400, easing = awestore.easing.cubic_in_out })
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
  local y = (screen_geometry.height - height) / 2

  local bench = bling.module.scratchpad:new {
    command = "kitty --class kitty-bench -d '$HOME/Documents/Delta' nvim Bench.md",
    rule = {class = "kitty-bench"},
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = {x = x, y = y, height = height, width = width},
    reapply = true,
    awestore = {
      y = awestore.tweened(screen_geometry.height * 2, { duration = 400, easing = awestore.easing.cubic_in_out })
    }
  }

  awesome.connect_signal("scratch::bench", function() bench:toggle() end)

  return bench
end

local quest_scratch = function(screen_geometry)
  local width = math.min(screen_geometry.width / 3, 1400)
  local height = screen_geometry.height * 0.90
  local x = (screen_geometry.width - width - 20)
  local y = (screen_geometry.height - height) / 2

  local quest = bling.module.scratchpad:new{
      command = "kitty --class kitty-quest --hold zk quest",
      rule = {class = "kitty-quest"},
      sticky = false,
      autoclose = false,
      floating = true,
      geometry = {x = x, y = y, height = height, width = width},
      reapply = true,
      awestore = {x = awestore.tweened(screen_geometry.width * 2, {duration = 400, easing = awestore.easing.cubic_in_out})}
  }

  awesome.connect_signal("scratch::quest", function() quest:toggle() end)

  return quest
end


-- initialize scratchpads
_M.init = function()
    local scratchpads = {
      terminal_scratch,
      monitor_scratch,
      bench_scratch,
      quest_scratch
    }

    for _idx, scratch in pairs(scratchpads) do
      scratch(screen.primary.geometry)
    end
end

return _M

