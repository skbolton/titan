local gfs = require 'gears.filesystem'

-- map a required icon to an image
local icon_mappings = {
  terminal = "checkbox-blank-circle-line.svg",
  terminal_active = "checkbox-blank-circle-fill.svg",
  browser = "checkbox-blank-circle-line.svg",
  browser_active = "checkbox-blank-circle-fill.svg",
  chat = "checkbox-blank-circle-line.svg",
  chat_active = "checkbox-blank-circle-fill.svg",
  explorer = "checkbox-blank-circle-line.svg",
  explorer_active = "checkbox-blank-circle-fill.svg",
  music = "checkbox-blank-circle-line.svg",
  music_active = "checkbox-blank-circle-fill.svg",
  mail = "checkbox-blank-circle-line.svg",
  mail_active = "checkbox-blank-circle-fill.svg",
}

local icons = {}
for name, icon in pairs(icon_mappings) do
  icons[name] = gfs.get_configuration_dir() .. "icons/remix/" .. icon
end

return icons

