" language server 
nmap <leader>ld <Plug>(coc-definition)zz
nnoremap <leader>lD :call CocAction('jumpDefinition', 'vsplit')<CR>zz
noremap <leader>lh :call CocAction('doHover')<CR>
noremap <leader>lo :CocList outline<CR>
nnoremap <leader>lO :Vista<CR>
noremap <leader>lp :CocList diagnostics<CR>
noremap <leader>l? :CocInfo<CR>
noremap <leader>lr :CocRestart<CR>

" Quickfix 
nnoremap <silent> <UP> :cope<CR>
nnoremap <silent> <DOWN> :cclose<CR>
nnoremap <silent> <leader>cn :cnext<CR>
nnoremap <silent> <leader>cp :cprev<CR>
nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <LEFT> :cprev<CR>
" Make many of the jump commands also center on search term
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap * *zz
nnoremap # #zz
nnoremap <silent> <leader>, :nohlsearch<CR>
nnoremap <leader>/ :silent grep<space>
nnoremap <leader>co :cw<CR>
nnoremap <leader>cc :ccl<CR>

" Sneak
let g:sneak#label = 1
" set ag as the grep program
if executable('rg') 
  set grepprg=rg\ --vimgrep
endif

vnoremap <c-q><c-r> :%DB g:db_url<CR>
nnoremap <c-q><c-s> :DB g:db_url =

nnoremap <BS> :b#<CR>
let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

let g:vista_icon_indent = ["▸ ", ""]

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "ﬦ",
\   "module": " ",
\   "variable": "\ufb18 ",
\   "constant": ""
\  }

let g:vista_default_executive = 'coc'


" supertab completions
" This is how I got it so that tabbing moves down the completion list
" from top to bottom instead of upwards
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

let g:clap_theme = 'embark'
let g:clap_current_selection_sign = { 'text': ' ' }
let g:clap_open_action = { 'ctrl-t': 'tab split', 'ctrl-v': 'vsplit', 'ctrl-s': 'split' }
let g:clap_layout = {'relative': 'editor'}

" -------------- NERDtree -----------------
nnoremap <silent><leader>\ :NERDTreeToggle<CR>
nnoremap <silent><leader>pf :Clap files --hidden "!.git/"<CR>
nnoremap <silent><leader>pb :CtrlPBuffer<CR>
nnoremap <silent><leader>pc :Clap command<CR>
nnoremap <silent><leader>pr :Clap registers<CR>
nnoremap <leader>ps :silent grep 
nnoremap <leader>pS :silent grep! 

" TODO: I need to find a better place for this config
" ------------ Projectionist ----------------
" not stricltly search related but close enough
" Open projections in splits
nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>
nnoremap <leader>a :A<CR>
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
