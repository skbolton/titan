let mapleader=" "
let maplocalleader="-"

nnoremap ; :
nnoremap : ;
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

tnoremap <Esc> <C-\><C-n>

" More quickly call external programs
nnoremap <leader>> :!<space>

" Copy/Paste from register
vnoremap <leader>cc "*y
map <leader>vv "*p

