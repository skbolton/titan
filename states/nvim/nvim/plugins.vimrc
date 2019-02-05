" Ale stuff
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'elixir':  ['mix_format']
\}
let g:ale_linters = {
\    'javascript': ['eslint', 'tsserver'],
\    'javascript.jsx': ['eslint', 'tsserver']
\}

let g:ale_elixir_elixir_ls_release=$HOME . "/.elixir-ls/rel"

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_eslint_use_local_config = 1
let g:ale_sign_error = '●'

nnoremap <leader>ld :ALEGoToDefinition<CR>
nnoremap <leader>lv :ALEGoToDefinitionInVSplit<CR>
nnoremap <leader>lH :ALEGoToDefinitionInSplit<CR>
nnoremap <leader>lh :ALEHover<CR>
nnoremap <leader>le :echo "hi"<CR>

""let g:deoplete#enable_at_startup = 1
""
""call deoplete#custom#source('omni', 'functions', {
""		    \ 'javascript': ['LanguageClient#complete', 'jspc#omni']
""\})
""
""call deoplete#custom#source('_', 'sorters', [])

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
let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
\ 'file': '\.so$\|\.dat$|\.DS_Store$'
\ }

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
      \ 'colorscheme': 'nord',
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

let g:indentLine_enabled = 1
let g:indentLine_char = '|'

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

