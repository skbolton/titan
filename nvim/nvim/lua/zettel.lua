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
-- CUSTOM COMMANDS
commands.add("ZkOpenNotes", function(options)
  options = vim.tbl_extend("force", { excludeHrefs = {os.getenv("ZK_NOTEBOOK_DIR") .. "/Logbook"} }, options or {})
  zk.edit(options, { title = "Reference" })
end)

-- CUSTOM COMMANDS
commands.add("ZkSpells", function(options)
  options = vim.tbl_extend("force", { dir = "Ref", tags = {"spell"} }, options or {})
  zk.edit(options, { title = "Spellbook" })
end)
