syntax enable

" Colors and styling {{{
highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic
set termguicolors
"}}}

" Spaces and Tabs {{{}
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}

" UI Config {{{
set encoding=utf8
" Give us a realtime preview of substitution before we send it
set inccommand=nosplit
set list
set lcs=extends:❯,precedes:❮,tab:>-
set number
set relativenumber
set ruler
set cursorline
set smartindent
set autoindent
set wrap
set linebreak
set wildmenu
set lazyredraw
set showmatch
set noshowmode " lightline shows the status not vim
set showtabline=2
set shortmess+=c
set updatetime=300
set signcolumn=yes
"set showcmd
"}}}

" Searching {{{
set incsearch
set hlsearch
set smartcase
set ignorecase
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
" }}}

set nobackup
set nowritebackup
set noswapfile
set hidden
set history=100
set path+=**
set splitbelow
set splitright

set diffopt=vertical,filler

set completeopt=menuone,noselect,noinsert
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
let g:calendar_view="week" 

let b:ls = 'ls'
