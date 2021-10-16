local nest = require('nest')

nest.applyKeymaps {
  {
    '<leader>', {
      {
        { '\\', '<CMD>NvimTreeToggle<CR>' },
        { '<BAR>', '<CMD>NvimTreeFindFile<CR>' },
        { '/', ':silent grep ', options = { silent = false }},
        { '_', "<CMD>lua require'telescope.builtin'.live_grep()<CR>" },
        {
          'f', {
            { 'f', "<CMD>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' } })<CR>" },
            { 'r', "<CMD>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<CR>" },
            { 'g', "<CMD>lua require'telescope.builtin'.git_status()<CR>" },
            { 'b', "<CMD>lua require'telescope.builtin'.git_branches()<CR>" },
            { '?', "<CMD>TodoTelescope<CR>" },
          }
        }
      }
    }
  }
}

