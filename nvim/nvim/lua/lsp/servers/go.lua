local nvim_lsp = require 'lspconfig'

local _M = {}

function _M.init(capabilities, on_attach)
  return nvim_lsp.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

return _M
