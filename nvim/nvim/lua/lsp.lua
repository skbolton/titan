vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd completion-nvim')
vim.cmd('packadd diagnostic-nvim')

local nvim_lsp = require'nvim_lsp'
local protocol = require'vim.lsp.protocol'
local completion = require'completion'
local diagnostic = require'diagnostic'

vim.g.diagnostic_virtual_text_prefix = '⏣ '
vim.g.diagnostic_enable_virtual_text = 1

vim.fn['sign_define']("LspDiagnosticsErrorSign", {text = "", texthl = "LspDiagnosticsError"})
vim.fn['sign_define']("LspDiagnosticsWarningSign", {text = "", texthl = "LspDiagnosticsWarning"})
vim.fn['sign_define']("LspDiagnosticsHintSign", {text = "", texthl = "LspDiagnosticsWarning"})

-- configuration across servers
local function attach(client)
  completion.on_attach(client) 
  diagnostic.on_attach(client) 

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
  settings = {
    elixirLS = {
      dialyzerEnabled = false;
    }
  }
}

