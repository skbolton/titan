packadd vim-dadbod
setlocal commentstring=--\ %s

let g:db_url = $DATABASE_URL
nnoremap <buffer> <localleader>rc :DB g:db_url = 
vnoremap <buffer> <localleader>r :%DB g:db_url<CR>

nnoremap <buffer> <localleader>r :normal vip<CR>:%DB g:db_url<CR>
nnoremap <buffer> <localleader>f :%!sql-formatter-cli .<CR>

vnoremap <buffer> <localleader>f :%!sql-formatter-cli .<CR>
