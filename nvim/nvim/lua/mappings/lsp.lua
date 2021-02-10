local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

map('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
map('n', '<leader>lD', ':vsp <BAR> :lua vim.lsp.buf.definition()<CR>zz', { noremap = true, silent = true })
map('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
map('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', default_opts)
map('n', '<leader>lo', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', default_opts)
map('n', '<leader>lO', ':packadd vista.vim <BAR> Vista<CR>', default_opts)
map('n', '<leader>lp', ':CocList diagnostics<CR>', default_opts)
map('n', '<leader>l?', ':CocInfo<CR>', default_opts) 
map('n', '<leader>lr', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR> :edit<CR>', default_opts) 

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap = true, expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {noremap = true, expr = true})

