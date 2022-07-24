local cmp_lsp = require 'cmp_nvim_lsp'
local elixir = require 'lsp.servers.elixir'
local zk = require 'lsp.servers.zk'
local go = require 'lsp.servers.go'
local beancount = require 'lsp.servers.beancount'

local lsp = vim.lsp
local map = vim.keymap.set

local definition_in_split = function()
  -- open a split, this will carry the current buffer over
  vim.api.nvim_command('vsp')
  -- go to definition
  lsp.buf.definition()
  -- center cursor
  vim.api.nvim_command('normal zz')
end

-- enable snippets and completion goodnes
local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local attach_mappings = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.api.nvim_create_autocmd('BufWritePre', { buffer = bufnr, callback = lsp.buf.formatting_seq_sync })

  map('n', '<CR>', vim.lsp.buf.definition, opts)
  map('n', '<leader><CR>', definition_in_split, opts)
  map('n', '<leader>ls', vim.lsp.buf.signature_help, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', '<leader>lf', vim.lsp.buf.formatting_sync, opts)
  map('n', '<leader>lo', '<CMD>Telescope lsp_document_symbols<cr>', opts)
  map('n', '<leader>l=', vim.lsp.diagnostic.show_line_diagnostics, opts)
  map('n', '<leader>li', vim.lsp.diagnostic.set_loclist, opts)
  map('n', '<leader>lO', '<CMD>Vista<CR>', opts)
  map('n', '<leader>l?', '<CMD>LspInfo<CR>', opts)
  map('n', '<leader>lr', '<CMD>LspRestart<CR>', opts)
end

for _, language_server in pairs({ elixir, zk, go, beancount }) do
  language_server.init(capabilities, attach_mappings)
end
