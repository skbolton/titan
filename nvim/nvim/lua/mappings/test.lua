local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true, silent = true}

map('n', '<leader>tt', ':TestFile<CR>', default_opts)
map('n', '<leader>tT', ':TestFile -strategy=neovim<CR>', default_opts)
map('n', '<leader>tn', ':TestNearest<CR>', default_opts)
map('n', '<leader>tN', ':TestNearest -strategy=neovim<CR>', default_opts)
map('n', '<leader>t.', ':TestLast<CR>', default_opts)
map('n', '<leader>tv', ':TestVisit<CR>zz', default_opts)
map('n', '<leader>ts', ':TestSuite<CR>', default_opts)
map('n', '<leader>tS', ':TestSuite -strategy=neovim<CR>', default_opts)
