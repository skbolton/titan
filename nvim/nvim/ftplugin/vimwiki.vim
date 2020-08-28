" Load in additional support plugins
packadd goyo.vim
packadd vim-livedown
packadd vim-taskwarrior

" Launch wiki's more easily
nmap <buffer> <localleader>1 1<Plug>VimwikiIndex
nmap <buffer> <localleader>2 2<Plug>VimwikiIndex

" Jump to wiki diary index's easier
nmap <buffer> <localleader>cd <Plug>VimwikiDiaryIndex
nmap <buffer> <localleader>pd 2<Plug>VimwikiDiaryIndex

" Make creating diary notes easier
nnoremap <buffer> <localleader>dd :VimwikiMakeDiaryNote<CR>

" Seed diary index
nnoremap <buffer> <localleader>di :VimwikiDiaryGenerateLinks<CR>
nnoremap <buffer> <localleader><DOWN> :VimwikiDiaryNextDay<CR>
nnoremap <buffer> <localleader><UP> :VimwikiDiaryPrevDay<CR>

" Search tags
nnoremap <buffer> <localleader>/ :VimwikiSearchTags<SPACE>

" Pop open calendar
nnoremap <buffer> <localleader>C :Calendar<CR>

" live preview of markdown in brower
nnoremap <buffer> <localleader>r :LivedownPreview<CR>
nnoremap <silent> <buffer> <localleader>f :Goyo<CR>

let b:AutoPairs={}
