packadd vim-textobj-elixir

nnoremap <buffer> <localleader>d :silent ! open https://hexdocs.pm/
setlocal foldmethod=indent

" Undo anything
let b:undo_ftplugin .= '|setlocal foldmethod<'
