vim.cmd('packadd nvim-lspconfig')

local nvim_lsp = require'lspconfig'
local protocol = require'vim.lsp.protocol'

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

  protocol.CompletionItemKind = {
    ' '; -- Text
    ' ';  -- Method
    ' '; -- Function
    ' '; -- Constructor
    ' '; -- Field
    ' '; --Variable
    ' '; -- Class
    ' '; -- Interface
    ' '; -- Module
    ' '; -- Property
    ''; -- Unit
    ''; -- Value
    ' '; -- Enum
    ''; -- Keyword
    ' '; -- Snippet
    ' '; -- Color
    ' '; -- file
    ''; -- Reference
    ' '; -- Folder
    ' '; -- EnumMember
    ' '; -- Constant
    ''; -- Struct
    ''; -- Event
    ''; -- Operator
    ''; -- TypeParameter
  }
end

local capabilities = protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP SERVER CONFIGURATION
-- ===================================================================
nvim_lsp.elixirls.setup{
  on_attach=attach;
  capabilities = capabilities,
  cmd = {
    vim.loop.os_homedir() .. "/.elixir-ls/rel/language_server.sh"
  };
  settings = {
    elixirLS = {
      dialyzerEnabled = true;
    }
  }
}

