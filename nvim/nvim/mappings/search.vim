" Sneak
let g:sneak#label = 1
" set ag as the grep program
if executable('rg') 
    set grepprg=rg\ --vimgrep\ --hidden\ -g\ !.git
endif

nnoremap <silent><leader>\ :packadd nerdtree <BAR>packadd vim-nerdtree-syntax-highlight <BAR>NERDTreeToggle<CR>
nnoremap <silent><leader><bar> :packadd nerdtree <BAR>packadd vim-nerdtree-syntax-highlight <BAR>NERDTreeFind<CR>
nnoremap <silent><leader>ff :Files<CR>
nnoremap <silent><leader>fr :Buffers<CR>
