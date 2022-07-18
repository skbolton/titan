local _M = {}
local loader = {}

function _M.init(icon_pack)
  loader = require('icons.' .. icon_pack)
  return _M
end

function _M.get(icon)
  return loader[icon]
end

return _M

