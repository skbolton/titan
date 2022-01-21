local awful = require "awful"

local completed_today = "task end.after:today end.before:today+1d count"
local due_in_next_two_weeks = "task +PENDING due.before:today + 2w count"
local overdue = "task +OVERDUE count"

awful.widget.watch(completed_today, 60, function(widget, stdout)
  awesome.emit_signal("tw::completed", stdout)
end)

awful.widget.watch(due_in_next_two_weeks, 60, function(widget, stdout)
  awesome.emit_signal("tw::due", stdout)
end)

awful.widget.watch(overdue, 60, function(widget, stdout)
  awesome.emit_signal("tw::overdue", stdout)
end)
