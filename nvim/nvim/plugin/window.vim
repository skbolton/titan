" When vimwindow is resized resize splits
au VimResized * exe "normal! \<c-w>="

" Highligh post yank
au TextYankPost * silent! lua vim.highlight.on_yank({ timeout = 400 })
