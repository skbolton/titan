nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lD :vsp <BAR> :lua vim.lsp.buf.definition()<CR>zz
nnoremap <silent> <leader>ls <cmd>lua vim.lsp.buf.signature_help()<CR>
noremap <silent> <leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
noremap <silent> <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>lo :packadd vista.vim <BAR> Vista finder skim<CR>
nnoremap <leader>lO :packadd vista.vim <BAR> Vista<CR>
noremap <leader>lp :CocList diagnostics<CR>
noremap <leader>l? :CocInfo<CR>
nnoremap <leader>lr <cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR> :edit<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

