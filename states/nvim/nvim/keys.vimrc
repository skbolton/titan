let mapleader=" "

nnoremap ; :
nnoremap : ;

" Searching goodies
nnoremap / /\v
nnoremap n nzz
nnoremap N Nzz

" Open a quickfix window for last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>

nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

nnoremap <leader>, :nohlsearch<CR>
