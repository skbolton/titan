nnoremap <leader>db :DBUI<CR>
nnoremap <buffer> <leader>\ :DBUIToggle<CR>
nnoremap <buffer> <localleader>rc :DB g:db_url = 
vnoremap <buffer> <localleader>r :%DB g:db_url<CR>

nnoremap <buffer> <localleader>r :normal vip<CR>:%DB g:db_url<CR>
nnoremap <buffer> <localleader>F :%!sql-formatter-cli .<CR>
nnoremap <buffer> <localleader>f :normal vip<CR>:!sql-formatter-cli<CR>
nmap <buffer> <leader>w <Plug>(DBUI_SaveQuery)
