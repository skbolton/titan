local map = vim.keymap.set

map('n', '<leader><DOWN>', '<CMD>VimwikiMakeDiaryNote<CR>')
map('n', '<leader><UP>', '<CMD>VimwikiDiaryIndex<CR>')
map('n', '<leader><LEFT>', '<CMD>VimwikiDiaryPrevDay<CR>')
map('n', '<leader><RIGHT>', '<CMD>VimwikiDiaryNextDay<CR>')
