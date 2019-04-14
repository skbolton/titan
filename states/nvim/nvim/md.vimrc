" Vim wiki stuff
let g:vimwiki_list = [{'path': '~/Drive/wiki/', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Drive/wiki/Work/', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Drive/wiki/Coding', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/Drive/wiki/Personal', 'syntax': 'markdown', 'ext': '.md'}]

" Helpers for launching my different wikis
nmap <leader>www 2<leader>ww
nmap <leader>wwc 3<leader>ww
nmap <leader>wwp 4<leader>ww 
" Helpers for launching wikis diaries
nmap <leader>wiw 2<leader>wi
nmap <leader>wic 3<leader>wi
nmap <leader>wip 4<leader>wi
" Livedown is a markdown server
let g:livedown_autorun = 0
" Open the browser window upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337
