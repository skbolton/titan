local capabilities = require 'lsp_capabilities'()

if vim.fn.executable('gopls') then
  vim.lsp.start {
    name = 'gopls',
    cmd = { gopls },
    capabilities = capabilities,
    root_dir = vim.fs.dirname(vim.fs.find({'go.mod', '.git'}, { upward = true })[1]),
  }
end
