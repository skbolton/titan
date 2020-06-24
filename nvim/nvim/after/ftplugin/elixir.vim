packadd vim-textobj-elixir
packadd emmet-vim

nnoremap <buffer> <localleader>d :silent ! open https://hexdocs.pm/
setlocal foldmethod=indent

" Undo anything
let b:undo_ftplugin .= '|setlocal foldmethod<'
