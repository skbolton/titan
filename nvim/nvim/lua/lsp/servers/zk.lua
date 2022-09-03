local zk = require 'zk'

local _M = {}

function _M.init(capabilities, on_attach)
  return zk.setup {
    picker = "telescope",
    lsp = {
      config = {
        capabilities = capabilities,
        on_attach = on_attach
      },
      auto_attach = {
        enabled = true
      }
    }
  }
end

return _M
