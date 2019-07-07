let mapleader=" "
let maplocalleader="-"

nnoremap ; :
nnoremap : ;
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" More quickly call external programs
nnoremap <leader>> :!<space>

" Copy/Paste from register
vnoremap <leader>cc "*y
map <leader>vv "*p

