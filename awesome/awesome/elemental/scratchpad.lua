local awful = require("awful")
local bling = require("module.bling")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local awestore = require("awestore")
local helpers = require("helpers")

local terminal_scratch = bling.module.scratchpad:new {
  command = "kitty --class kitty-scratch --hold",
  rule = {class = "kitty-scratch"},
  sticky = true,
  autoclose = false,
  geometry = {x = dpi(400), y = dpi(60), height = dpi(600), width = dpi(2800)},
  floating = true,
  reapply = true,
  awestore = {
    y = awestore.tweened(-1200, { duration = 500, easing = awestore.easing.cubic_in_out })
  }
}

awesome.connect_signal("scratch::terminal", function() terminal_scratch:toggle() end)

local monitor_scratch = bling.module.scratchpad:new {
  command = "kitty --class kitty-monitor bpytop",
  rule = {class = "kitty-monitor"},
  sticky = true,
  autoclose = false,
  geometry = {x = dpi(600), y = dpi(200), height = dpi(1000), width = dpi(2400)},
  floating = true,
  reapply = true,
  awestore = {
    y = awestore.tweened(-12000, { duration = 400, easing = awestore.easing.cubic_in_out })
  }
}

awesome.connect_signal("scratch::monitor", function() monitor_scratch:toggle() end)

local bench_scratch = bling.module.scratchpad:new{
    command = "kitty --class kitty-bench -d '$HOME/Documents/Delta' nvim Bench.md",
    rule = {class = "kitty-bench"},
    sticky = true,
    autoclose = false,
    floating = true,
    geometry = {x = dpi(1300), y = dpi(200), height = dpi(900), width = dpi(1200)},
    reapply = true,
    awestore = {
      y = awestore.tweened(-1200, { duration = 400, easing = awestore.easing.cubic_in_out })
    }

}

awesome.connect_signal("scratch::bench", function() bench_scratch:toggle() end)

local quest_scratch = bling.module.scratchpad:new{
    command = "kitty --class kitty-quest --hold zk quest",
    rule = {class = "kitty-quest"},
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = {x = 2400, y = 60, height = dpi(1500), width = dpi(1400)},
    reapply = true,
    awestore = {x = awestore.tweened(8000, {duration = 400, easing = awestore.easing.cubic_in_out})}
}

awesome.connect_signal("scratch::quest", function() quest_scratch:toggle() end)

local task_scratch = bling.module.scratchpad:new{
    command = "kitty --class kitty-tasks",
    rule = {class = "kitty-tasks"},
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = {x = 40, y = 60, height = dpi(1500), width = dpi(1400)},
    reapply = true,
    awestore = {y = awestore.tweened(3500, {duration = 400, easing = awestore.easing.cubic_in_out})}
}

awesome.connect_signal("scratch::task", function() task_scratch:toggle() end)

