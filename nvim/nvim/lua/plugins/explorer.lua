return {
  'luukvbaal/nnn.nvim',
  config = function()
    local nnn = require("nnn")
    require('nnn').setup {
      mappings = {
        { "<C-t>", nnn.builtin.open_in_tab },       -- open file(s) in tab
        { "<C-s>", nnn.builtin.open_in_split },     -- open file(s) in split
        { "<C-v>", nnn.builtin.open_in_vsplit },    -- open file(s) in vertical split
      }
    }
  end
}
