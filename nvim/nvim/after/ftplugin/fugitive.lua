local bmap = vim.api.nvim_buf_set_keymap
local fugitive_buffers = 0

bmap(fugitive_buffers, 'n', '<TAB>', '=', {})
bmap(fugitive_buffers, 'n', '<UP>', '[/>zt', {})
bmap(fugitive_buffers, 'n', '<DOWN>', ']/>zt', {})
