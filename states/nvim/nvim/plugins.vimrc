" Ale stuff
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'elixir':  ['mix_format']
\}
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'javascript.jsx': ['eslint']
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_local_config = 1
let g:ale_sign_error = '●'

nmap <leader>lh <Plug>(coc-diagnostic-info)
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>la <Plug>(coc-references)
nmap <leader>lr <Plug>(coc-rename)

let g:projectionist_heuristics = {
      \   'src/*': {
      \     '*.js': {
      \       'alternate': [
      \         '{dirname}/{basename}.test.js',
      \         '{dirname}/__tests__/{basename}.test.js',
      \       ],
      \       'type': 'source'
      \     },
      \     '*.test.js': {
      \       'alternate': [
      \         '{dirname}/{basename}.js',
      \         '{dirname}/../{basename}.js'
      \       ],
      \       'type': 'test',
      \     },
      \     '**/__tests__/*-mocha.js': {
      \       'alternate': '{dirname}/{basename}.js',
      \       'type': 'test'
      \     },
      \     '**/__tests__/*-test.js': {
      \       'alternate': '{dirname}/{basename}.js',
      \       'type': 'test'
      \     }
      \   }
      \ }

au FileType elixir let b:AutoPairs = AutoPairsDefine({'do': 'end//n'})

let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
let g:neomake_open_list = 1
let g:test#strategy = 'neomake'
let g:neomake_warning_sign = {
  \   'text': '◉'
  \ }

let g:neomake_error_sign = {
  \   'text': '◉'
  \ }

" autocmd QuickFixCmdPost [^l]* cwindow
" autocmd QuickFixCmdPost l* lwindow

let g:livedown_autorun = 0
" Open the browser window upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337

" JavaScript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_domhtmlcss = 1

" lang server


"Ctrl-P stuff
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_user_command='ag %s -l --nocolor --ignore ".git/" --hidden -g ""'
let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
\ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }
let g:ctrolp_use_caching=0

"Emmet
let g:user_emmet_settings = {
  \ 'javascript.jsx': {
    \ 'extends': 'jsx',
  \}
\}
let g:user_emmet_mode='inv'

" Theme stuff
let g:palenight_terminal_italics=1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_italic = 1
let g:nord_cursor_line_number_background = 1
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'filename' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': {
      \   'left': '',
      \   'right': ''
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
    \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" Show message that tests have started
function! MyOnNeomakeJobStarted() abort
  echom printf('🔮 Running tests...')
endfunction

" Show message when all tests are passing
function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    echom printf('🧙 All tests passed ')
  endif
  if context.jobinfo.exit_code == 1
    echom printf('🤬 Failing tests')
  endif
endfunction

augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
  autocmd User NeomakeJobStarted call MyOnNeomakeJobStarted()
augroup END
