local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'
local cmp_lsp = require('cmp_nvim_lsp')

local lsp = vim.lsp

local definition_in_split = function()
  -- open a split, this will carry the current buffer over
  vim.api.nvim_command('vsp')
  -- go to definition
  lsp.buf.definition()
  -- center cursor
  vim.api.nvim_command('normal zz')
end

-- Go to a diagnostic based on direction
-- Wrapping results causes going back to beginning/end of file
local goto_diagnostic = function(dir)
  if dir == 'next' then
    return function()
      return lsp.diagnostic.goto_next({ wrap = true })
    end
  else
    return function()
      return lsp.diagnostic.goto_prev({ wrap = true })
    end
  end
end

-- enable snippets and completion goodnes
local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', '<CR>', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<CR><CR>', definition_in_split, opts)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting_sync, opts)
  vim.keymap.set('n', '<leader>lo', '<CMD>Vista finder skim<cr>', opts)
  vim.keymap.set('n', '<leader>l[', goto_diagnostic('prev'), opts)
  vim.keymap.set('n', '<leader>l]', goto_diagnostic('next'), opts)
  vim.keymap.set('n', '<leader>l=', vim.lsp.diagnostic.show_line_diagnostics, opts)
  vim.keymap.set('n', '<leader>li', vim.lsp.diagnostic.set_loclist, opts)
  vim.keymap.set('n', '<leader>lO', '<CMD>Vista<CR>', opts)
  vim.keymap.set('n', '<leader>l?', '<CMD>LspInfo<CR>', opts)
  vim.keymap.set('n', '<leader>lr', '<CMD>:LspRestart<CR>', opts)
end

-- LSP SERVER CONFIGURATION
-- ===================================================================
nvim_lsp.elixirls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    vim.loop.os_homedir() .. "/.local/share/elixir-ls/rel/language_server.sh"
  };
  settings = {
    elixirLS = {
      dialyzerEnabled = true;
    }
  }
}

nvim_lsp.gopls.setup {}

-- ZK configuration
-- add configuration to lspconfig
configs.zk = {
  default_config = {
    cmd = {'zk', 'lsp'},
    filetypes = {'markdown'},
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  };
}

-- ZK
nvim_lsp.zk.setup{
  capabilities = capabilities
}

-- beancount
nvim_lsp.beancount.setup {
  cmd = {
    'beancount-langserver',
    '--stdio'
  },
  init_options = {
    journalFile = "/home/orlando/Documents/Delta/journal.beancount",
    pythonPath = "python3"
  }
}
