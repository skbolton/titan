function! FileNameWithIcon() abort
  return winwidth(0) > 70  ? " " . WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '' 
endfunction

function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Line_num() abort
  return string(line('.'))
endfunction

function! Active_tab_num(n) abort
    return " " . a:n . " \ue0bb"
endfunction

function! Inactive_tab_num(n) abort
  return " " . a:n . " \ue0bb "
endfunction

function! Line_percent() abort
  return string((100*line('.'))/line('$'))
endfunction

function! Col_num() abort
    return string(getcurpos()[2])
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return fugitive#head() .  " " . "\ue702"
  else
    return "\uf468"
  endif
endfunction

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})

  if get(info, 'error', 0)
    return "\uf46f"
  endif

  if get(info, 'warning', 0)
    return info['warning'] . "\uf421"
  endif

  return "\uf42e" 
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'challenger_deep'
let g:lightline.active = { 
      \ 'left': [ ['mode', 'readonly'], ['filename_with_icon', 'modified' ] ],
      \ 'right': [ ['lineinfo'], ['status_diagnostic'] ]
      \ }
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be " }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba " }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#gitdiff#indicator_added = "\uf055 "
let g:lightline#gitdiff#indicator_deleted = "\uf057 "
let g:lightline#gitdiff#indicator_modified = "\uf056 "

let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo', 'tabs' ] ],
            \ 'right': [ [ 'git_branch' ], [ 'gitdiff' ]]
            \ }
let g:lightline.tab = {
        \ 'active': ['artify_activetabnum', 'filename_with_parent'],
        \ 'inactive': ['artify_inactivetabnum', 'filename']
        \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
            \ 'artify_activetabnum': 'Active_tab_num',
            \ 'artify_inactivetabnum': 'Inactive_tab_num',
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }

let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'lineinfo': "%2{Line_percent()}\uf295 %3{Line_num()}:%-2{Col_num()}",
        \ 'vim_logo': "\ue62b",
        \ 'git_branch': '%{Git_branch()}',
        \ 'filename_with_parent': '%t',
        \ 'status_diagnostic': '%{StatusDiagnostic()}'
        \ }

let g:lightline.component_expand = { 'gitdiff': 'lightline#gitdiff#get' }

let g:lightline.component_function = {
        \ }

