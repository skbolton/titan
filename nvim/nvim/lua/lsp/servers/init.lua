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

local formatting_augrop = vim.api.nvim_create_augroup("LSPFORMATTING", {})

local attach_mappings = function(client, bufnr)
  -- format on save if client supports it
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = formatting_augrop, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = formatting_augrop,
      buffer = bufnr,
      callback = function() lsp.buf.format() end
    })
  end

  local opts = { buffer = bufnr }

  map('n', '<CR>', vim.lsp.buf.definition, opts)
  map('n', '<C-CR>', definition_in_split, opts)
  map('n', '<leader>ls', vim.lsp.buf.signature_help, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', '<leader>lf', vim.lsp.buf.formatting_sync, opts)
  map('n', '<leader>lo', '<CMD>Telescope lsp_document_symbols<cr>', opts)
  map('n', '<leader>li', vim.diagnostic.setloclist, opts)
  map('n', '<leader>lO', '<CMD>Vista<CR>', opts)
  map('n', '<leader>l?', '<CMD>LspInfo<CR>', opts)
  map('n', '<leader>lr', '<CMD>LspRestart<CR>', opts)
end

for _, language_server in pairs({ elixir, zk, go }) do
  language_server.init(capabilities, attach_mappings)
end
