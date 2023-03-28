local map = vim.keymap.set

map('n', '<leader>tt', '<CMD>TestFile<CR>')
map('n', '<leader>tT', '<CMD>TestFile -strategy=neomake<CR>')
map('n', '<leader>tn', '<CMD>TestNearest<CR>')
map('n', '<leader>tN', '<CMD>TestNearest -strategy=neomake<CR>')
map('n', '<leader>t.', '<CMD>TestLast<CR>')
map('n', '<leader>tv', '<CMD>TestVisit<CR>zz')
map('n', '<leader>ts', '<CMD>TestSuite<CR>')
map('n', '<leader>tS', '<CMD>TestSuite -strategy=neomake<CR>')
map('n', '<leader>tc', '<CMD>VimuxClearTerminalScreen<CR>')
map('n', '<leader>tq', '<CMD>VimuxCloseRunner<CR>')
