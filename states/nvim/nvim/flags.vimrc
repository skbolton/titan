" The use case of the file is to catch a whole bunch of environment things so
" that themes and things can be dynamic
if executable('tmux') && filereadable(expand('~/.zshrc')) && $TMUX !=# ''
  let g:VIM_IN_TMUX = 1
else
  let g:VIM_IN_TMUX = 0
endif

let g:VIM_LSP_CLIENT = 'coc' " coc ale
let g:VIM_COMPLETION_FRAMEWORK = 'coc' " coc ale


let g:TESTING_STATUS = 'passing'

