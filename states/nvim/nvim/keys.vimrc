let mapleader=" "
let maplocalleader="-"

nnoremap ; :
nnoremap : ;
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Quickly send output
nnoremap <leader>> :!<space>

" Git mappings
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" vim-test mappings
nnoremap <silent> <leader>tt :TestFile<CR>
nnoremap <silent> <leader>tn :TestNearest<CR>

" Open up todoist
nnoremap <silent> <leader>- :silent !open -a Todoist<CR>

nnoremap <leader>rn :! node %<CR>
nnoremap <leader>rc :! crystal %<CR>

"nnoremap <leader>Tp i =strftime()<CR>
nmap <leader>Tp a <C-R>=strftime('%b %d, %Y')<CR><Esc>

" Copy/Paste from register
vnoremap <leader>cc "*y
map <leader>vv "*p

