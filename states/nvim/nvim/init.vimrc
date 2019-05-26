set rtp+=~/.vundle/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Completetions
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'neomake/neomake'
Plugin 'saltstack/salt-vim'
Plugin 'neoclide/coc.nvim'
" Themes
Plugin 'ayu-theme/ayu-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rakr/vim-one'
Plugin 'dracula/vim'
Plugin 'tpope/vim-sensible'
Plugin 'shime/vim-livedown'
Plugin 'kaicataldo/material.vim'
Plugin 'sainnhe/artify.vim'
Plugin 'sainnhe/lightline_foobar.vim'
" Syntax stuff and autocomplete
Plugin 'jparise/vim-graphql'
Plugin 'othree/yajs.vim'
Plugin 'moll/vim-node'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ervandew/supertab'
Plugin 'janko/vim-test'
" Notes and tasks section
Plugin 'vimwiki/vimwiki'
Plugin 'blindFS/vim-taskwarrior'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tbabej/taskwiki'

" Typescript
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'quramy/tsuquyomi'

" Airline and style stuff
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/calendar.vim'

" Git Stuff
Plugin 'tpope/vim-fugitive'
Plugin 'niklaas/lightline-gitdiff'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'wakatime/vim-wakatime'
Plugin 'mxw/vim-jsx'
Plugin 'heavenshell/vim-jsdoc'

" Elixir Stuff
Plugin 'rhysd/vim-crystal'
Plugin 'slashmili/alchemist.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mhinz/vim-mix-format'
Plugin 'ryanoasis/vim-devicons'
call vundle#end()
