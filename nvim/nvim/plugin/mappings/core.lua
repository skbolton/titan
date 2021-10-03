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
map('n', '<UP>', ':cope<CR>', {noremap = true, silent = true})
map('n', '<DOWN>', ':cclose<CR>', {noremap = true, silent = true})
map('n', '<RIGHT>', ':cnext<CR>zz', {noremap = true, silent = true})
map('n', '<LEFT>', ':cprev<CR>zz', {noremap = true, silent = true})

-- make jump commands center the screen on search term
map('n', 'n', 'nzz', default_opts)
map('n', 'N', 'Nzz', default_opts)
map('n', '<C-o>', '<C-o>zz', default_opts)
map('n', '<C-i>', '<C-i>zz', default_opts)
map('n', '*', '*zz', default_opts)
map('n', '#', '#zz', default_opts)
map('n', '<leader>', ':nohlsearch<CR>', {noremap = true, silent = true})
map('n', '<BS>', ':b#<CR>', default_opts)

-- Have esc work just like it does in vim when running terminal
map('t', '<Esc>', '<c-\\><c-n>', default_opts)

-- More quickly call external programs
map('n', '<leader>>', ':!<space>', default_opts)

-- copy and paste
map('v', '<leader>cc', '"+y', default_opts)
map('', '<leader>vv', '"+p', default_opts)
