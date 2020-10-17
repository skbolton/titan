" Vim wiki stuff
let g:vimwiki_folding = 'expr'

let code_wiki = {}
let code_wiki.path = '~/cloud/Knowledge/Coding'
let code_wiki.syntax = 'markdown'
let code_wiki.ext = '.md'
let code_wiki.links_space_char = '_'
let code_wiki.auto_diary_index = 1
let code_wiki.automatic_nested_syntaxes = 1

let delta_wiki = {}
let delta_wiki.path = '~/cloud/Knowledge/Delta'
let delta_wiki.syntax = 'markdown'
let delta_wiki.ext = '.md'
let delta_wiki.links_space_char = '_'
let delta_wiki.auto_diary_index = 1

let zettel = {}
let zettel.path = "~/cloud/Knowledge/Zettel"
let zettel.automatic_nested_syntaxes = 1
let zettel.ext = '.md'
let zettel.links_space_char = '_'
let zettel.syntax = 'markdown'

let g:vimwiki_list = [code_wiki, delta_wiki, zettel]
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
 execute 'silent lgrep -g "!index.md" ' . task_id . ' ~/cloud/Knowledge/'
endfunction

