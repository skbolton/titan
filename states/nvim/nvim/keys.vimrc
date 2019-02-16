let mapleader=" "

nnoremap ; :
nnoremap : ;

" Searching goodies
" Center search result line in screen
nnoremap n nzz
nnoremap N Nzz

" Open a quickfix window for last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>
" Open and close quickfix menu
nnoremap <leader>co :cw<CR>
nnoremap <leader>cc :ccl<CR>

nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

nnoremap <CR> :nohlsearch<CR>

nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>
nnoremap <leader>a :A<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
