" Vim wiki stuff
let code_wiki = {}
let code_wiki.path = '~/cloud/wiki/Coding'
let code_wiki.syntax = 'markdown'
let code_wiki.ext = '.md'
let code_wiki.auto_diary_index = 1
let code_wiki.nested_syntaxes = {'js': 'javascript', 'javascript': 'javascript', 'elixir': 'elixir', 'gql': 'graphql'}

let personal_wiki = {}
let personal_wiki.path = '~/cloud/wiki/Personal'
let personal_wiki.syntax = 'markdown'
let personal_wiki.ext = '.md'
let personal_wiki.auto_diary_index = 1

let g:vimwiki_list = [code_wiki, personal_wiki]
let g:taskwiki_maplocalleader="-"
let g:taskwiki_markup_syntax = 'markdown'

" Livedown is a markdown server
let g:livedown_autorun = 0
" Open the browser window upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337

