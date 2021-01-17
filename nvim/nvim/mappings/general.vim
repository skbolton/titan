let mapleader=" "
let maplocalleader="-"

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Quickfix 
nnoremap <silent> <UP> :cope<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <RIGHT> :cnext<CR>zz
nnoremap <silent> <LEFT> :cprev<CR>zz

" Make many of the jump commands also center on search term
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap * *zz
nnoremap # #zz
nnoremap <silent> <leader>, :nohlsearch<CR>
nnoremap <leader>/ :silent grep<space>
nnoremap <BS> :b#<CR>

" Have esc work just like it does in vim when running terminal
tnoremap <Esc> <C-\><C-n>

" More quickly call external programs
nnoremap <leader>> :!<space>

" Copy/Paste from register
vnoremap <leader>cc "+y
map <leader>vv "+p

