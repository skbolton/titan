local has_telescope, telescope = pcall(require, 'telescope.builtin')

if not has_telescope then
  return
end

local map = vim.keymap.set

map('n', '<leader>E', '<CMD>NnnExplorer<CR>')
map('n', '<leader>e', '<CMD>NnnPicker %:p<CR>')
map('n', '<leader>/', ':silent grep ', { silent = false })
map('n', '<leader>_', telescope.live_grep)
map( 'n', '<leader><leader>', telescope.find_files)
map( 'n', '<leader><Backspace>', telescope.buffers)
map( 'n', '<leader>ff', telescope.find_files)
map( 'n', '<leader>fr', telescope.buffers)
