local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true}

map('n', '<leader>gs', ':G<CR>', default_opts)
map('n', '<leader>gS', "<cmd>lua require'telescope.builtin'.git_status()<CR>", default_opts)
map('n', '<leader>gB', "<cmd>lua require'telescope.builtin'.git_branches()<CR>", default_opts)
map('n', '<leader>gc', ':Git commit<CR>', default_opts)
map('n', '<leader>gd', ':Gdiff<CR>', default_opts)
map('n', '<leader>gb', ':Git blame<CR>', default_opts)
map('n', '<leader>gw', ':Gwrite<CR>', default_opts)
map('n', '<leader>gr', ':Gread<CR>', default_opts)
map('n', '<leader>gl', ':Gclog<CR>', default_opts)
map('n', '<leader>gh', ':0Gclog<CR>', default_opts)
map('n', '<leader>gm', ':GitMessenger<CR>', default_opts)
map('n', '<leader>gv', ':GBrowse<CR>', default_opts)
map('v', '<leader>gv', ':GBrowse<CR>', default_opts)
map('n', '<leader>gV', ':GBrowse!<CR>', default_opts)
map('v', '<leader>gV', ':GBrowse!<CR>', default_opts)
map('n', '<leader>g<down>', ':Git pull<CR>', default_opts)
map('n', '<leader>g<up>', ':Git push<CR>', default_opts)
map('n', '<leader>g<up>!', ':Git push -f<CR>', default_opts)

map('n', '<leader>dh', ':diffget<CR>', default_opts)
map('n', '<leader>dl', ':diffget<CR>', default_opts)
map('n', '<leader>dj', ':diffput<CR>', default_opts)

map('v', '<leader>dh', ':diffget<CR>', default_opts)
map('v', '<leader>dl', ':diffget<CR>', default_opts)
map('v', '<leader>dj', ':diffput<CR>', default_opts)
