" JSDOC
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_domhtmlcss = 1

"Emmet
let g:user_emmet_settings = {
  \ 'javascript.jsx': {
    \ 'extends': 'jsx',
  \}
\}
let g:user_emmet_mode='inv'

" Go to npm for package docs
function! Docs(name)
  if &ft == 'javascript.jsx'
    execute "silent !" . "open https://npmjs.org/package/" . a:name
  elseif &ft == 'javascript'
    execute "silent !" . "open https://npmjs.org/package/" . a:name
  elseif &ft == 'elixir'
    execute "silent !" . "open https://hex.pm/packages/" . a:name
  else
    echom "Cannot lookup docs." . &ft " filetype not configured"
  endif
endfunction

nnoremap <leader>dc :call Docs("")<left><left>
