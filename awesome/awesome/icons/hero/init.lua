local gfs = require 'gears.filesystem'

-- map a required icon to an image
local icon_mappings = {
  terminal = "terminal.svg",
  terminal_active = "terminal.svg",
  browser = "globe.svg",
  browser_active = "globe.svg",
  chat = "chat-alt-2.svg",
  chat_active = "chat-alt-2.svg",
  explorer = "bookmark.svg",
  explorer_active = "bookmark.svg",
  music = "music-note.svg",
  music_active = "music-note.svg",
  mail = "mail.svg",
  mail_active = "mail.svg",
}

local icons = {}
for name, icon in pairs(icon_mappings) do
  icons[name] = gfs.get_configuration_dir() .. "icons/hero/" .. icon
end

return icons

