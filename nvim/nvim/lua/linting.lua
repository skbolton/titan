local lint = require 'lint'
local parser = require 'lint.parser'

lint.linters_by_ft = {
  elixir = { 'credo' }
}

local group = vim.api.nvim_create_augroup('MyLinter', {})

vim.api.nvim_create_autocmd({'BufWritePost', 'BufEnter'}, {pattern = {"*.ex", "*.exs"}, callback = lint.try_lint, group = group})
