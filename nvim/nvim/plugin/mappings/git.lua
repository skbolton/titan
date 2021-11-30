local nest = require('nest')
local telescope = require('telescope.builtin')
local Job = require('plenary.job')

-- Gets the default branch for the current repository
-- `git default-branch` is a git alias
local get_default_branch = function()
  return Job:new({
    command = 'git',
    args = { 'default-branch' }
  }):sync()[1]
end

-- Do a diff split against origin's default branch
-- Can be helpful when on a long lived feature branch to see the difference of a file
local diff_against_default_branch = function()
  return vim.api.nvim_command("Gvdiffsplit origin/" .. get_default_branch() .. ":%")
end

-- GRead from origin's default branch
-- Blow away all changes from the current branch
local read_default_branch = function()
  return vim.api.nvim_command("Gread origin/" .. get_default_branch() .. ":%")
end

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
          -- other diff keybinds
          {
            'd', {
              { 'd', diff_against_default_branch },
            }
          },
          { 'b', "<CMD>Git blame<CR>" },
          { 'w', "<CMD>Gwrite<CR>" },
          { 'r', "<CMD>Gread<CR>" },
          -- other read shortcuts
          {
            'r', {
              { 'd', read_default_branch },
            }
          },
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
          },
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

