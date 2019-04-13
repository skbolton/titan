let mapleader=" "

nnoremap ; :
nnoremap : ;
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Git mappings
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>

" vim-test mappings
nnoremap <silent> <leader>tt :TestFile<CR>
nnoremap <silent> <leader>tn :TestNearest<CR>

nnoremap <leader>rn :! node %<CR>
nnoremap <leader>rc :! crystal %<CR>

