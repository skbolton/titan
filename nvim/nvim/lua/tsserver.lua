local executable = 'typescript-language-server'
local capabilities = require 'lsp_capabilities'()

if vim.fn.executable(executable) then
  vim.lsp.start {
    name = 'tsserver',
    cmd = { executable, '--stdio' },
    capabilities = capabilities,
    root_dir = vim.fs.dirname(vim.fs.find({'tsconfig.json', 'package.json', 'jsconfig.json', '.git'}, { upward = true })[1])
  }
end
