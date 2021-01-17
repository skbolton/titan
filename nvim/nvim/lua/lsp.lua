vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd completion-nvim')

local nvim_lsp = require'lspconfig'
local protocol = require'vim.lsp.protocol'
local completion = require'completion'

-- LSP Diagnositics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = '⏣ '
    },

    signs = true
  }
)

-- LSP Diagnostics signs
vim.fn['sign_define']("LspDiagnosticsSignError", {text = "", texthl = "LspDiagnosticsError"})
vim.fn['sign_define']("LspDiagnosticsSignWarning", {text = "", texthl = "LspDiagnosticsWarning"})
vim.fn['sign_define']("LspDiagnosticsSignHint", {text = "", texthl = "LspDiagnosticsWarning"})

-- configuration across servers
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

nvim_lsp.elixirls.setup{
  on_attach=attach;
  cmd = {vim.loop.os_homedir() .. "/.elixir-ls/rel/language_server.sh"};
  settings = {
    elixirLS = {
      dialyzerEnabled = true;
    }
  }
}

