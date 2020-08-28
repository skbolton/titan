augroup glados
  autocmd BufEnter *.divvy.co_sql* :call SwitchColorScheme('nord')
  autocmd BufEnter *.divvy.co_sql* :set filetype=sql
  autocmd BufEnter *.divvy.co_sql* :set showtabline=0
  autocmd BufEnter *.divvy.co_sql* :call lightline#disable()
  autocmd BufEnter *.divvy.co_sql* :DB g:db_url = postgres://postgres@localhost:5432/juno_dev
augroup END

if exists('g:started_by_firenvim')
  let g:lightline.enable = {
        \ 'statusline': 0,
        \ 'tabline': 0
        \}

  set showtabline=0
  set laststatus=0

  set guifont=Operator\ Mono\ Lig\ Book:h10
endif

