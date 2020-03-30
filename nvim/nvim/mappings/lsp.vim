" language server 
nmap <silent> <leader>ld <Plug>(coc-definition)zz
nnoremap <silent> <leader>lD :call CocAction('jumpDefinition', 'vsplit')<CR>zz
noremap <silent> <leader>lh :call CocAction('doHover')<CR>
nnoremap <leader>lo :CocList outline<CR>
nnoremap <leader>lO :packadd vista.vim <BAR> Vista<CR>
noremap <leader>lp :CocList diagnostics<CR>
noremap <leader>l? :CocInfo<CR>
noremap <leader>lr :CocRestart<CR>

" supertab completions
" This is how I got it so that tabbing moves down the completion list
" from top to bottom instead of upwards
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'


