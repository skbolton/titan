local map = vim.keymap.set

map('n', '<leader>E', '<CMD>NnnExplorer<CR>')
map('n', '<leader>e', '<CMD>NnnPicker %:p<CR>')
map('n', '<leader>_', ':silent grep ', { silent = false })
