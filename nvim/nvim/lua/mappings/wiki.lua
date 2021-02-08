local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

map('n', 'localleader>gy', ':Goyo<CR>', default_opts)
