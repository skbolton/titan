vim.cmd('packadd nvim-lspconfig')
vim.cmd('packadd completion-nvim')

local nvim_lsp = require'nvim_lsp'
local protocol = require'vim.lsp.protocol'

-- configuration across servers
local function attach()
  require'completion'.on_attach() 

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
    dialyzerEnabled = false;
  }
}
