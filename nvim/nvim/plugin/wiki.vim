" Vim wiki stuff
let g:vimwiki_folding = 'syntax'

let reference_wiki = {}
let reference_wiki.path = '~/Documents/sync/Knowledge/Personal'
let reference_wiki.syntax = 'markdown'
let reference_wiki.ext = '.md'
let reference_wiki.links_space_char = '_'
let reference_wiki.auto_diary_index = 1
let reference_wiki.automatic_nested_syntaxes = 1

let coding_wiki = {}
let coding_wiki.path = '~/Documents/sync/Knowledge/Coding'
let coding_wiki.syntax = 'markdown'
let coding_wiki.ext = '.md'
let coding_wiki.links_space_char = '_'
let coding_wiki.auto_diary_index = 1
let coding_wiki.automatic_nested_syntaxes = 1

let zettel = {}
let zettel.path = "~/Documents/sync/Knowledge/Zettel"
let zettel.automatic_nested_syntaxes = 1
let zettel.ext = '.md'
let zettel.links_space_char = '_'
let zettel.syntax = 'markdown'

let g:vimwiki_list = [reference_wiki, coding_wiki, zettel]
let g:taskwiki_maplocalleader="-t"
let g:taskwiki_markup_syntax = 'markdown'

" Livedown is a markdown server
let g:livedown_autorun = 0
" Open the browser window upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337

" Zettel Goodies
let g:zettel_format = "%y%m%d-%H%M"
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

function TaskSearch()
 let line = getline('.')
 let task_id = split(line, "#")[1]
 execute 'silent lgrep -g "!index.md" ' . task_id . ' ~/Documents/sync/Knowledge/'
endfunction

