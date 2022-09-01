local nvim_lsp = require 'lspconfig'

local _M = {}

function _M.init(capabilities, on_attach)
  nvim_lsp.beancount.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      journal_file = "/home/orlando/Documents/Delta/Areas/Finances/journal.beancount",
    }
  }
end

return _M
