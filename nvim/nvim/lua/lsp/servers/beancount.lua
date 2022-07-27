local nvim_lsp = require'lspconfig'

local _M = {}

function _M.init(capabilities, on_attach)
  nvim_lsp.beancount.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
      'beancount-langserver',
      '--stdio'
    },
    init_options = {
      journalFile = "/home/orlando/Documents/Notes/journal.beancount",
      pythonPath = "python3"
    }
  }
end

return _M
