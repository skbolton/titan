local nest = require('nest')
local telescope = require('telescope.builtin')

local all_buffers = function()
  return telescope.buffers({ show_all_buffers = true })
end

-- find files
-- include hidden files but not from the git directory
local find_files = function()
  return telescope.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git'} })
end

nest.applyKeymaps {
  {
    '<leader>', {
      {
        { '\\', '<CMD>NnnExplorer<CR>' },
        { '<BAR>', '<CMD>NnnPicker %:p<CR>' },
        { '/', ':silent grep ', options = { silent = false }},
        { '_', telescope.live_grep },
        {
          'f', {
            { 'f', find_files },
            { 'r', all_buffers },
            { 'g', telescope.git_status },
            { 'b',  telescope.git_branches },
            { '?', "<CMD>TodoTelescope<CR>" }
          }
        }
      }
    }
  }
}

