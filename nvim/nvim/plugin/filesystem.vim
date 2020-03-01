" ---------- Ctrl-P stuff --------------
"  Put ctrl p at the bottom ordererf from top to bottom
let g:ctrlp_match_window='bottom,order:ttb,min:1,max:20,results:20'
" use rg as our ctrlp finder
let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
" rg is fast enough we don't need no stinking cache
let g:ctrlp_use_caching=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" Basically disable nerdtree markers
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ' '
let g:DevIconsDefaultFolderOpenSymbol = ' '

let g:clap_enable_icon = 1
let g:clap_current_selection_sign = { 'text': ' ' }
let g:clap_open_action = { 'ctrl-t': 'tab split', 'ctrl-v': 'vsplit', 'ctrl-s': 'split' }
let g:clap_layout = {'relative': 'editor'}

let g:picker_custom_find_executable = 'rg'
let g:picker_custom_find_flags = '--color never --files --hidden -g !.git/'
let g:picker_selector_executable = 'sk'
let g:picker_selector_flags = ''
let g:picker_height = 15
