" Sneak
let g:sneak#label = 1
" set ag as the grep program
if executable('rg') 
  set grepprg=rg\ --vimgrep\ --hidden
endif

nnoremap <silent><leader>\ :NERDTreeToggle<CR>
nmap <silent><leader>pf <Plug>(PickerEdit)
nmap <silent><leader>pv <Plug>(PickerVsplit)
nmap <silent><leader>ps <Plug>(PickerSplit)
nmap <silent><leader>pb <Plug>(PickerBuffer)
nnoremap <silent><leader>pc :Clap command<CR>
nnoremap <silent><leader>pr :Clap registers<CR>
