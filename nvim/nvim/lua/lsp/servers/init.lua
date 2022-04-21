local cmp_lsp = require 'cmp_nvim_lsp'
local elixir = require 'lsp.servers.elixir'
local zk = require 'lsp.servers.zk'
local go = require 'lsp.servers.go'
local beancount = require 'lsp.servers.beancount'

local lsp = vim.lsp

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

  vim.keymap.set('n', '<CR>', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader><CR>', definition_in_split, opts)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting_sync, opts)
  vim.keymap.set('n', '<leader>lo', '<CMD>Telescope lsp_document_symbols<cr>', opts)
  vim.keymap.set('n', '<leader>l=', vim.lsp.diagnostic.show_line_diagnostics, opts)
  vim.keymap.set('n', '<leader>li', vim.lsp.diagnostic.set_loclist, opts)
  vim.keymap.set('n', '<leader>lO', '<CMD>Vista<CR>', opts)
  vim.keymap.set('n', '<leader>l?', '<CMD>LspInfo<CR>', opts)
  vim.keymap.set('n', '<leader>lr', '<CMD>LspRestart<CR>', opts)
end

for _, language_server in pairs({ elixir, zk, go, beancount }) do
  language_server.init(capabilities, attach_mappings)
end
