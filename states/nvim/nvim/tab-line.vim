function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Active_tab_num(n) abort
    return " " . a:n . "  "
endfunction

function! Inactive_tab_num(n) abort
  return " " . a:n . " \ue0bb "
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return fugitive#head() .  " " . "\ue702 "
  else
    return "\uf468"
  endif
endfunction

let g:lightline#gitdiff#indicator_added = "  "
let g:lightline#gitdiff#indicator_deleted = "  "
let g:lightline#gitdiff#indicator_modified = "  "

let g:lightline.tabline_separator = { 'left': "", 'right': "" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }

let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo', 'tabs' ] ],
            \ 'right': [ [ 'git_branch' ], [ 'gitdiff' ]]
            \ }

let g:lightline.tab = {
        \ 'active': ['artify_activetabnum', 'filename_with_parent'],
        \ 'inactive': ['artify_inactivetabnum', 'filename']
        \ }

let g:lightline.tab_component_function = {
            \ 'artify_activetabnum': 'Active_tab_num',
            \ 'artify_inactivetabnum': 'Inactive_tab_num',
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }

let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'lineinfo': "%2{Line_percent()}\uf295 %3{Line_num()}:%-2{Col_num()}",
        \ 'vim_logo': "\ue7c5 ",
        \ 'git_branch': '%{Git_branch()}',
        \ 'filename_with_parent': '%t',
        \ 'status_diagnostic': '%{StatusDiagnostic()}',
        \ 'testing_status': '%{TestingStatus()}'
        \ }

let g:lightline.component_expand = { 'gitdiff': 'lightline#gitdiff#get' }
