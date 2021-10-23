local nest = require('nest')

-- define the leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "-"

nest.applyKeymaps {
  -- flip ; and :
  { ';', ':', options = { silent = false } },
  { ':', ';' },
  {
    mode = 'v', {
        -- flip ; and : in visual as well
        { ';', ':', options = { silent = false }},
        { ':', ';' },
        {
          '<leader>', {
            {'cc',  '"+y'}
          }
        }
    }
  },
    -- quickfix list
  { '<UP>', '<CMD>cope<CR>' },
  { '<DOWN>', '<CMD>cclose<CR>' },
  { '<RIGHT>', '<CMD>cnext<CR>' },
  { '<LEFT>', '<CMD>cprev<CR>' },
  -- make jump commands center the screen on search term
  {'n', 'nzz'},
  {'N', 'Nzz'},
  {'<C-o>', '<C-o>zz'},
  {'<C-i>', '<C-i>zz'},
  {'*', '*zz'},
  {'#', '#zz'},
  {'<BS>', '<CMD>b#<CR>'},
  {
    '<leader>', {
      { ',', '<CMD>nohlsearch<CR>' },
      { '>', ':!<SPACE>', options = { silent = false }},
    }
  },
  {
    mode = 't', {
      { '<ESC>', '<c-\\><c-n>' }
    }
  }
}

