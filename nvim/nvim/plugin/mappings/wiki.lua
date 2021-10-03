local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

map('n', '<leader><DOWN>', '<cmd>VimwikiMakeDiaryNote<cr>', default_opts)
map('n', '<leader><UP>', '<cmd>VimwikiDiaryIndex<cr>', default_opts)
map('n', '<leader><LEFT>', '<cmd>VimwikiDiaryPrevDay<cr>', default_opts)
map('n', '<leader><RIGHT>', '<cmd>VimwikiDiaryNextDay<cr>', default_opts)
