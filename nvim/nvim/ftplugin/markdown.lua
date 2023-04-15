local blocal = vim.opt_local

vim.keymap.set('n', '<localleader>r', '<CMD>MarkdownPreview<CR>', { buffer = true })
blocal.textwidth = 120

local toggle_todo = function()
  local linenr = vim.api.nvim_win_get_cursor(0)[1]
  local curline = vim.api.nvim_buf_get_lines(0, linenr - 1, linenr, false)[1]

  if string.find(curline, "%- %[ ]") then
    vim.cmd('s/\\v-\\s\\[\\s\\]/- [x]')
    vim.cmd('nohlsearch')
  elseif string.find(curline, "%- %[x]") then
    vim.cmd('s/\\v-\\s\\[x\\]/- [ ]')
    vim.cmd('nohlsearch')
  end
end

vim.keymap.set('n', '<C-SPACE>', toggle_todo, { buffer = true })
vim.keymap.set('i', '<C-t>t', '**<C-R>=strftime("%H:%M")<CR>** ', { buffer = true })
vim.keymap.set('i', '<C-t>d', '**<C-R>=strftime("%Y-%m-%d")<CR>** ', { buffer = true })
