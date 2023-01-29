local zk = require('zk')
local util = require('zk.util')
local commands = require('zk.commands')

zk.setup {
  picker = "telescope",
  lsp = {
    config = {
      on_attach = on_attach
    },
    auto_attach = {
      enabled = true
    }
  }
}
