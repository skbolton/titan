local map = vim.keymap.set

vim.diagnostic.config {
  underline = false,
  virtual_text = {
    prefix = ""
  },
  signs = true,
}

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<C-g>', vim.diagnostic.open_float)

-- Sign Icons
local signs = { Error = '裂', Warn = ' ', Hint = ' ' }

-- Consigure signs
for type, icon in pairs(signs) do
  local highlight = "DiagnosticSign" .. type
  vim.fn.sign_define(highlight, { text = icon, texthl = highlight })
end
