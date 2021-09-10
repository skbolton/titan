local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
map('n', '<leader>lD', ':vsp <BAR> :lua vim.lsp.buf.definition()<CR>zz', { noremap = true, silent = true })
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', default_opts)
map('n', '<leader>lo', ':Vista finder skim<cr>', default_opts)
map('n', '<leader>l[', '<cmd>lua vim.lsp.diagnostic.goto_prev({ wrap = true })<CR>', default_opts)
map('n', '<leader>l]', '<cmd>lua vim.lsp.diagnostic.goto_next({ wrap = true })<CR>', default_opts)
map('n', '<leader>l=', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({})<CR>', default_opts)
map('n', '<leader>li', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', default_opts)
map('n', '<leader>lO', ':Vista<CR>', {noremap = true, silent = true})
map('n', '<leader>lp', ':CocList diagnostics<CR>', default_opts)
map('n', '<leader>l?', ':CocInfo<CR>', default_opts) 
map('n', '<leader>lr', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR> :edit<CR>', default_opts) 
map('i', '<C-y>', "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap = true, expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {noremap = true, expr = true})

