-- When leaving vim fix the cursor
-- without this I was always having the cursor be a block when leaving vim
vim.cmd([[
  au VimLeave * set guicursor=a:ver10-blinkwait800
]])
