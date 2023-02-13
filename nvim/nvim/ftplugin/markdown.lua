local blocal = vim.opt_local

vim.keymap.set('n', '<localleader>r', '<CMD>MarkdownPreview<CR>', { buffer = true })
blocal.textwidth = 82
