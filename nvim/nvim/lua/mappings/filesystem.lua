local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

map('n', '<leader>\\', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader><bar>', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files()<cr>", default_opts)
map('n', '<leader>fr', "<cmd>lua require'telescope.builtin'.buffers()<cr>", default_opts)
map('n', '<leader>/', "<cmd>lua require'telescope.builtin'.live_grep()<cr>", default_opts)
