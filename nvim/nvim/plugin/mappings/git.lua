local has_telescope, telescope = pcall(require, 'telescope.builtin')
local has_plenary, Job = pcall(require, 'plenary.job')

if not has_telescope or not has_plenary then
  return
end

local map = vim.keymap.set

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

map('n', '<leader>gg', '<CMD>G<CR>')
map('n', '<leader>go', '<CMD>Git difftool --name-only<CR>')
map('n', '<leader>gO', '<CMD>Git difftool<CR>')
map('n', '<leader>gd', '<CMD>Gdiff<CR>')
map('n', '<leader>gdd', diff_against_default_branch)
map('n', '<leader>gb', '<CMD>Git blame<CR>')
map('n', '<leader>gw', '<CMD>Gwrite<CR>')
map('n', '<leader>gr', '<CMD>Gread<CR>')
map('n', '<leader>grd', read_default_branch)
map('n', '<leader>gl', '<CMD>Gclog<CR>')
map('n', '<leader>gh', '<CMD>0Gclog<CR>')
map('n', '<leader>gm', '<CMD>GitMessenger<CR>')
map('n', '<leader>g<down>', '<CMD>Git pull<CR>')
map('n', '<leader>g<up>', '<CMD>Git push<CR>')

map('n', '<leader>dh', '<CMD>diffget<CR>')
map('n', '<leader>dl', '<CMD>diffget<CR>')
map('n', '<leader>dj', '<CMD>diffput<CR>')

map('v', '<leader>gv', '<CMD>Gbrowse<CR>')
map('v', '<leader>gV', '<CMD>Gbrowse!<CR>')
map('v', '<leader>gh', '<CMD>diffget<CR>')
map('v', '<leader>gl', '<CMD>diffget<CR>')
map('v', '<leader>gj', '<CMD>diffput<CR>')

