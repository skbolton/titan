local has_telescope, telescope = pcall(require, 'telescope.builtin')

if not has_telescope then
  return
end

local all_buffers = function()
  return telescope.buffers({ show_all_buffers = true })
end

vim.keymap.set('n', '<leader>\\', '<CMD>NnnExplorer<CR>')
vim.keymap.set('n', '<leader><BAR>', '<CMD>NnnPicker %:p<CR>')
vim.keymap.set('n', '<leader>/', ':silent grep ', { silent = false })
vim.keymap.set('n', '<leader>_', telescope.live_grep)
vim.keymap.set( 'n', '<leader><leader>', telescope.find_files)
vim.keymap.set( 'n', '<leader>ff', telescope.find_files)
vim.keymap.set( 'n', '<leader>fr', telescope.buffers)
vim.keymap.set( 'n', '<leader>fg', telescope.git_status)
vim.keymap.set( 'n', '<leader>fb',  telescope.git_branches)
