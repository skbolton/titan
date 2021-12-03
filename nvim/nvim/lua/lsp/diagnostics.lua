-- LSP Diagnositics
-- ===================================================================

-- Configure lsp to do diagnostics
vim.diagnostic.config {
  virtual_text = true,
  signs = true
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = ''
    },

    signs = true
  }
)

-- Sign Icons
local signs = { Error = '', Warn = '', Hint = '' }

-- Consigure signs
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(highlight, { text = icon, icon = icon, texthl = highlight })
end
