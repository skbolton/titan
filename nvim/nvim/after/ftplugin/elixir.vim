nnoremap <buffer> <localleader>d :silent ! open https://hexdocs.pm/
setlocal foldmethod=indent

autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.formatting_sync(nil, 1000)

" Undo anything
let b:undo_ftplugin .= '|setlocal foldmethod<'
