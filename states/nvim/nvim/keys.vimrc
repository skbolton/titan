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

nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>
nnoremap <leader>a :A<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
