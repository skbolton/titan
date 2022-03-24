-- define the leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "-"

vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set({'n', 'v'}, ':', ';', { silent = true })
vim.keymap.set('v', '<leader>cc', '"+y')
vim.keymap.set('n', '<UP>', '<CMD>cope<CR>')
vim.keymap.set('n', '<DOWN>', '<CMD>cclose<CR>')
vim.keymap.set('n', '<RIGHT>', '<CMD>cnext<CR>')
vim.keymap.set('n', '<LEFT>', '<CMD>cprev<CR>')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', 'g;', 'g;zz')
vim.keymap.set('n', 'g,', 'g,zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '*', '*zz')
vim.keymap.set('n', '#', '#zz')
vim.keymap.set('n', '<BS>', '<CMD>b#<CR>')
vim.keymap.set('n', '<leader>,', '<CMD>nohlsearch<CR>')
vim.keymap.set('n', '<leader>>', ':!<SPACE>', { silent = false })
vim.keymap.set('t', '<ESC>', '<c-\\><c-n>', { silent = false })
