nnoremap <leader>db :DBUI<CR>
nnoremap <buffer> <leader>\ :DBUIToggle<CR>
# visually select the area under the cursor and run the query
nnoremap <buffer> <localleader>r :normal vip<CR><Plug>(DBUI_ExecuteQuery)
nnoremap <buffer> <localleader>F :%!sql-formatter-cli .<CR>
nnoremap <buffer> <localleader>f :normal vip<CR>:!sql-formatter-cli<CR>
nmap <buffer> <leader>w <Plug>(DBUI_SaveQuery)
