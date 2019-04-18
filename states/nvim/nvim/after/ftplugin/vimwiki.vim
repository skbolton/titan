" Launch wiki's more easily
nmap <buffer> <localleader>cw <Plug>VimwikiIndex
nmap <buffer> <localleader>pw 2<Plug>VimwikiIndex

" Jump to wiki diary index's easier
nmap <buffer> <localleader>cd <Plug>VimwikiDiaryIndex
nmap <buffer> <localleader>pd 2<Plug>VimwikiDiaryIndex

" Make creating diary notes easier
nnoremap <buffer> <localleader>dd :VimwikiMakeDiaryNote<CR>

" Seed diary index
nnoremap <buffer> <localleader>di :VimwikiDiaryGenerateLinks<CR>
nnoremap <buffer> <localleader><DOWN> :VimwikiDiaryNextDay<CR>
nnoremap <buffer> <localleader><UP> :VimwikiDiaryPrevDay<CR>
