local capabilities = require 'lsp_capabilities'()

local executable = 'beancount-language-server'

if vim.fn.executable(executable) then
  -- NOTE: This has been a somewhat flaky language server to work with
  -- vim.lsp.start {
  --   name = 'beancountlsp',
  --   cmd = { executable, '--stdio' },
  --   capabilities = capabilities,
  --   root_dir = vim.fs.dirname(vim.fs.find('.git', { upward = true })[1]),
  --   init_options = {
  --     journal_file = "/home/orlando/Documents/Delta/Areas/Finances/journal.beancount",
  --   }
  -- }
end
