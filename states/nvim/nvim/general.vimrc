set nocompatible

" Colors and styling {{{
colorscheme palenight
let ayucolor="mirage"
syntax enable
set background=dark 
highlight Comment cterm=italic
hi link xmlEndTag xmlTag
hi htmlArg gui=italic
hi Comment gui=italic
hi Type gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type cterm=italic
"  Italic garbage
let &t_8f="\<Esc>[38;2%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
"}}}

" Spaces and Tabs {{{}
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" }}}

" UI Config {{{
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
set nolist
set splitbelow
set splitright

set diffopt=vertical

set completeopt=menu,menuone,preview,noselect,noinsert
if executable('ag') 
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%:%:%%
endif
