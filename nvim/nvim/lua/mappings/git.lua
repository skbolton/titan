local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true}

map('n', '<leader>gs', ':G<CR>', default_opts)
map('n', '<leader>gc', ':Gcommit<CR>', default_opts)
map('n', '<leader>gd', ':Gdiff<CR>', default_opts)
map('n', '<leader>gb', ':Gblame<CR>', default_opts)
map('n', '<leader>gw', ':Gwrite<CR>', default_opts)
map('n', '<leader>gr', ':Gread<CR>', default_opts)
map('n', '<leader>gl', ':Glog<CR>', default_opts)
map('n', '<leader>gh', ':0Glog<CR>', default_opts)
map('n', '<leader>gm', 'GitMessenger<CR>', default_opts)

map('n', '<leader>dh', ':diffget<CR>', default_opts)
map('n', '<leader>dl', ':diffget<CR>', default_opts)
map('n', '<leader>dj', ':diffput<CR>', default_opts)

map('v', '<leader>dh', ':diffget<CR>', default_opts)
map('v', '<leader>dl', ':diffget<CR>', default_opts)
map('v', '<leader>dj', ':diffput<CR>', default_opts)
