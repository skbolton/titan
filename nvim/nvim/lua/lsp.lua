vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd completion-nvim')

local nvim_lsp = require'lspconfig'
local protocol = require'vim.lsp.protocol'
local completion = require'completion'

-- Vista
-- ===================================================================
vim.g.vista_sidebar_width = 45;
vim.g.vista_default_executive = 'nvim_lsp';
vim.g.vista_disable_statusline = true;
vim.g['vista#renderer#enable_icon'] = 1;
vim.g.vista_icon_indent = {"▸ ", ""};
vim.g['vista#renderer#icons'] = {
  ['function'] = 'ﬦ',
  module = ' ',
  variable = ' ',
  constant = ''
}

-- completion
-- ===================================================================
vim.g.completion_matching_strategy_list = { 'exact', 'substring' };
vim.g.completion_auto_change_source = 1;
vim.g.completion_trigger_character = {'.', '"'};
vim.g.completion_enable_snippet = 'vim-vsnip';
vim.g.completion_confirm_key = "<c-y>";

vim.g.completion_chain_complete_list = {
  default = {
      {complete_items = { 'lsp' }},
      {complete_items = { 'buffers' }},
      {mode = '<c-p>'},
      {mode = '<c-n>'}
  },
  sql = {
    {complete_items = { 'vim-dadbod-completion' }}
  }
}


-- LSP Diagnositics
-- ===================================================================
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = '⏣ '
    },

    signs = true
  }
)

vim.fn['sign_define']("LspDiagnosticsSignError", {text = "", texthl = "LspDiagnosticsError"})
vim.fn['sign_define']("LspDiagnosticsSignWarning", {text = "", texthl = "LspDiagnosticsWarning"})
vim.fn['sign_define']("LspDiagnosticsSignHint", {text = "", texthl = "LspDiagnosticsWarning"})

-- Attachment
-- ===================================================================
local function attach(client)
  completion.on_attach(client) 

  protocol.CompletionItemKind = {
    ' '; -- Text
    '';  -- Method
    'ﬦ'; -- Function
    ''; -- Constructor
    ''; -- Field
    ' '; --Variable
    ''; -- Class
    ' '; -- Interface
    ' '; -- Module
    ' '; -- Property
    ''; -- Unit
    ''; -- Value
    ''; -- Enum
    ''; -- Keyword
    ' '; -- Snippet
    ' '; -- Color
    ' '; -- file
    ''; -- Reference
    ' '; -- Folder
    ''; -- EnumMember
    ' '; -- Constant
    ''; -- Struct
    ''; -- Event
    ''; -- Operator
    ''; -- TypeParameter
  }
end

-- autocommand to attach completion to all buffers
vim.api.nvim_command('augroup completion');
vim.api.nvim_command('autocmd!');
vim.api.nvim_command("autocmd BufEnter * lua require'completion'.on_attach()");
vim.api.nvim_command('augroup END')

-- LSP SERVER CONFIGURATION
-- ===================================================================
nvim_lsp.elixirls.setup{
  on_attach=attach;
  cmd = {
    vim.loop.os_homedir() .. "/.elixir-ls/rel/language_server.sh"
  };
  settings = {
    elixirLS = {
      dialyzerEnabled = true;
    }
  }
}

