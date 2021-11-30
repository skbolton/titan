local nest = require('nest')
local telescope = require('telescope.builtin')

nest.applyKeymaps {
  {
    {
      '<leader>', {
        'g', {
          { 's', '<CMD>G<CR>' },
          { 'S', telescope.git_status },
          { 'B', telescope.git_branches },
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
          {
            mode = 'v', {
              { 'v', '<CMD>Gbrowse<CR>' },
              { 'V', '<CMD>Gbrowse!<CR>' },
              { 'h', '<CMD>diffget<CR>' },
              { 'l', '<CMD>diffget<CR>' },
              { 'j', '<CMD>diffput<CR>' },
            }
          }
        },
        'd', {
          { 'h', '<CMD>diffget<CR>' },
          { 'l', '<CMD>diffget<CR>' },
          { 'j', '<CMD>diffput<CR>' },
        }
      }
    }
  }
}

