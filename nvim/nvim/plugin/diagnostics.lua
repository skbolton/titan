vim.diagnostic.config {
  underline = false,
  virtual_text = {
    prefix = ""
  },
  signs = true,
}

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<C-g>', vim.diagnostic.open_float)

-- Sign Icons
local signs = { Error = '裂', Warn = ' ', Hint = ' ' }

-- Consigure signs
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(highlight, { text = icon, texthl = highlight })
end
