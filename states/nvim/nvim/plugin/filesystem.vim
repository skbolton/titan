" ---------- Ctrl-P stuff --------------
"  Put ctrl p at the bottom ordererf from top to bottom
let g:ctrlp_match_window='bottom,order:ttb,min:1,max:20,results:20'
" use rg as our ctrlp finder
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" rg is fast enough we don't need no stinking cache
let g:ctrlp_use_caching=0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " enable folder glyph flag
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
