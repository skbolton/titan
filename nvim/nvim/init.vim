runtime! general.vim
runtime! mappings/**/*.vim
runtime! tabline.vim

lua require 'plugins'
lua require 'tree'

autocmd BufWritePost plugins.lua PackerCompile

autocmd! FileType skim
autocmd  FileType skim set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
