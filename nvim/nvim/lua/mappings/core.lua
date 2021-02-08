local map = vim.api.nvim_set_keymap

local default_opts = {noremap = true}

-- define the leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "-"

-- flip ; and :
-- dont knock it till you try it
map('n', ';', ':', default_opts)
map('n', ':', ';', default_opts)
map('v', ';', ':', default_opts)
map('v', ':', ';', default_opts)

-- quickfix list
map('n', '<silent> <UP>', ':cope<CR>', default_opts)
map('n', '<silent> <DOWN>', ':cclose<CR>', default_opts)
map('n', '<silent> <RIGHT>', ':cnext<CR>zz', default_opts)
map('n', '<silent> <LEFT>', ':cprev<CR>zz', default_opts)

-- make jump commands center the screen on search term
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)
map('n', '<C-o>', '<C-o>zz', default_opts)
map('n', '<C-i>', '<C-i>zz', default_opts)
map('n', '*', '*zz', default_opts)
map('n', '#', '#zz', default_opts)
map('n', '<silent> <leader>', ':nohlsearch<CR>', default_opts)
map('n', '<BS>', ':b#<CR>', default_opts)

-- Have esc work just like it does in vim when running terminal
map('t', '<Esc>', '<c-\\><c-n>', default_opts)

-- More quickly call external programs
map('n', '<leader>>', ':!<space>', default_opts)

-- copy and paste
map('v', '<leader>cc', '"+y', default_opts)
map('', '<leader>vv', '"+p', default_opts)
