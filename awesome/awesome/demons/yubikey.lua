local awful = require("awful")
local naughty = require("naughty")

local event_stream = [[bash -c '
  nc -U $XDG_RUNTIME_DIR/yubikey-touch-detector.socket | while read -n5 cmd; do
    echo $cmd
  done
']]

awful.spawn.with_line_callback(event_stream, {
  stdout = function(line)
    local event, context
    -- U2F 
    if line:match("U2F") then
      context = "U2F"
      -- Started waiting
      if line:match("_1") then
        event = "start"
      -- Stopped waiting
      else
        event = "stop"
      end
    -- GPG
    else
      context = "GPG"
      -- Started waiting
      if line:match("_1") then
        event = "start"
      -- Stopped waiting
      else
        event = "stop"
      end
    end

    awesome.emit_signal("demon::yubikey", event, context)
  end,
  stderr = function(line)
    naughty.notify({ title = "Failure", text = line })
  end
})
