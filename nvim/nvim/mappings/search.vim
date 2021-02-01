" Sneak
let g:sneak#label = 1
" set ag as the grep program
if executable('rg') 
    set grepprg=rg\ --vimgrep\ --hidden\ -g\ !.git
endif

nnoremap <silent><leader>\ :NvimTreeToggle<CR>
nnoremap <silent><leader><bar> :NvimTreeFindFile<CR>
" nnoremap <silent><leader>ff :Files<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <silent><leader>fr :Buffers<CR>
