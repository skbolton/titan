local bmap = vim.api.nvim_buf_set_keymap
local blocal = vim.opt_local

blocal.foldmethod = "indent"

bmap(0, 'n', '<localleader>d', ':silent !xdg-open https://hexdocs.pm/', {noremap = true})

