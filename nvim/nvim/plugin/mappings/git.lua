local nest = require('nest')
local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true}

nest.applyKeymaps {
  {
    {
      '<leader>', {
        'g', {
          { 's', '<CMD>G<CR>' },
          { 'S', "<CMD>lua require'telescope.builtin'.git_status()<CR>" },
          { 'B', "<CMD>lua require'telescope.builtin'.git_branches()<CR>" },
          { 'c', "<CMD>Git commit<CR>" },
          { 'd', "<CMD>Gdiff<CR>" },
          { 'b', "<CMD>Git blame<CR>" },
          { 'w', "<CMD>Gwrite<CR>" },
          { 'r', "<CMD>Gread<CR>" },
          { 'l', '<CMD>Gclog<CR>' },
          { 'h', '<CMD>0Gclog<CR>' },
          { 'm', '<CMD>GitMessenger<CR>' },
          { '<down>', '<CMD>Git pull<CR>' },
          { '<up>', '<CMD>Git push<CR>' },
          { 'h', '<CMD>diffget<CR>' },
          { 'l', '<CMD>diffget<CR>' },
          { 'j', '<CMD>diffput<CR>' },
          {
            mode = 'v', {
              { 'v', '<CMD>Gbrowse<CR>' },
              { 'V', '<CMD>Gbrowse!<CR>' },
              { 'h', '<CMD>diffget<CR>' },
              { 'l', '<CMD>diffget<CR>' },
              { 'j', '<CMD>diffput<CR>' },
            }
          }
        }
      }
    }
  }
}

