local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

map('n', '<leader>\\', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader><bar>', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
map('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", default_opts)
map('n', '<leader>fr', "<cmd>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<cr>", default_opts)
map('n', '<leader>fg', "<cmd>lua require'telescope.builtin'.git_status()<cr>", default_opts)
map('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.git_branches()<cr>", default_opts)
map('n', '<leader>f?', ":TodoTelescope<cr>", default_opts)
map('n', '<leader>/', ":silent grep ", default_opts)
map('n', '<leader>_', "<cmd>lua require'telescope.builtin'.live_grep()<cr>", default_opts)
