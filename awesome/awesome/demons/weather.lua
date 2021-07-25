-- Provides:
-- signal::weather
--      emote (string - emoji for weather)
--      temp (integer - temperatur in °C)
--      wind (integer - wind velocity in km/h)
local awful = require("awful")
local beautiful = require("beautiful")

local city = beautiful.weather_city or "Tokyo"

local update_interval = 60 * 60

local script = [[
    sh -c '
    wttr_str=`curl wttr.in/]] .. city .. [[?format=2`
    echo $wttr_str
    '
]]

awful.widget.watch(script, update_interval, function(_, stdout)
    local list_weather_data = {}
    for element in stdout:gmatch("%S+") do
        table.insert(list_weather_data, element)
    end
    local emoji = list_weather_data[1]
    local temp = tonumber(string.sub(list_weather_data[2], 8,
                                     #list_weather_data[2] - 3))
    local wind = tonumber(string.sub(list_weather_data[3], 11,
                                     #list_weather_data[3] - 4))
    awesome.emit_signal("signal::weather", temp, wind, emoji)
end)
