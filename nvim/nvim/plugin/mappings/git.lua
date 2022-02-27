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

vim.keymap.set('n', '<leader>gs', '<CMD>G<CR>')
vim.keymap.set('n', '<leader>gS', telescope.git_status)
vim.keymap.set('n', '<leader>gB', telescope.git_branches)
vim.keymap.set('n', '<leader>gd', '<CMD>Gdiff<CR>')
vim.keymap.set('n', '<leader>gdd', diff_against_default_branch)
vim.keymap.set('n', '<leader>gb', '<CMD>Git blame<CR>')
vim.keymap.set('n', '<leader>gw', '<CMD>Gwrite<CR>')
vim.keymap.set('n', '<leader>gr', '<CMD>Gread<CR>')
vim.keymap.set('n', '<leader>grd', read_default_branch)
vim.keymap.set('n', '<leader>gl', '<CMD>Gclog<CR>')
vim.keymap.set('n', '<leader>gh', '<CMD>0Gclog<CR>')
vim.keymap.set('n', '<leader>gm', '<CMD>GitMessenger<CR>')
vim.keymap.set('n', '<leader>g<down>', '<CMD>Git pull<CR>')
vim.keymap.set('n', '<leader>g<up>', '<CMD>Git push<CR>')

vim.keymap.set('n', '<leader>dh', '<CMD>diffget<CR>')
vim.keymap.set('n', '<leader>dl', '<CMD>diffget<CR>')
vim.keymap.set('n', '<leader>dj', '<CMD>diffput<CR>')

vim.keymap.set('v', '<leader>gv', '<CMD>Gbrowse<CR>')
vim.keymap.set('v', '<leader>gV', '<CMD>Gbrowse!<CR>')
vim.keymap.set('v', '<leader>gh', '<CMD>diffget<CR>')
vim.keymap.set('v', '<leader>gl', '<CMD>diffget<CR>')
vim.keymap.set('v', '<leader>gj', '<CMD>diffput<CR>')

