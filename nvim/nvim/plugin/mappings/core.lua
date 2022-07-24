local map = vim.keymap.set
-- define the leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "-"

map({'n', 'v'}, ';', ':')
map({'n', 'v'}, ':', ';', { silent = true })
map('v', '<leader>cc', '"+y')
map('n', '<UP>', '<CMD>cope<CR>')
map('n', '<DOWN>', '<CMD>cclose<CR>')
map('n', '<RIGHT>', '<CMD>cnext<CR>')
map('n', '<LEFT>', '<CMD>cprev<CR>')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', 'g;', 'g;zz')
map('n', 'g,', 'g,zz')
map('n', '<C-o>', '<C-o>zz')
map('n', '<C-i>', '<C-i>zz')
map('n', '*', '*zz')
map('n', '#', '#zz')
map('n', '<BS>', '<CMD>b#<CR>')
map('n', '<leader>,', '<CMD>nohlsearch<CR>')
map('n', '<leader>>', ':!<SPACE>', { silent = false })
map('t', '<ESC>', '<c-\\><c-n>', { silent = false })
map('n', '[x', '<CMD>set cursorcolumn<CR>')
map('n', ']x', '<CMD>set nocursorcolumn<CR>')
