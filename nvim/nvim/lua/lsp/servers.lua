local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'
local cmp_lsp = require('cmp_nvim_lsp')

-- enable snippets and completion goodnes
local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP SERVER CONFIGURATION
-- ===================================================================
nvim_lsp.elixirls.setup{
  capabilities = capabilities,
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
