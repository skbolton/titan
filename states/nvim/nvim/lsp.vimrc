" Config for coc vim and its mappings
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>ld <Plug>(coc-definition)
nmap <leader>la <Plug>(coc-references)
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>lh :call <SID>show_documentation()<CR>
