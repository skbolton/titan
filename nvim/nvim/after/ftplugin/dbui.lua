local keymap = vim.keymap

keymap.set('n', '<C-v>', '<PLUG>(DBUI_SelectLineVsplit)', { buffer = true })
keymap.set('n', '<leader>\\', '<CMD>DBUIToggle<CR>', { buffer = true })
keymap.set('n', '<ENTER>', '<PLUG>(DBUI_SelectLine)', { buffer = true })
