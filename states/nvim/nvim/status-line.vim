function! TestingStatus() abort
  if g:TESTING_STATUS == 'passing'
    return "  "
  elseif g:TESTING_STATUS == 'running'
    return " "
  elseif g:TESTING_STATUS == 'failing'
    return " "
  endif
endfunction


function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '' 
endfunction

function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return  fugitive#head() . " "
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

  return "\uf42e " 
endfunction

let g:lightline = {}
let g:lightline.active = { 
      \ 'left': [ ['mode', 'readonly'], ['filename_with_icon', 'modified']],
      \ 'right': [['lineinfo'], ['testing_status', 'status_diagnostic'] ]
      \ }
let g:lightline.separator = { 'left': "", 'right': "" }
let g:lightline.tabline_separator = { 'left': "", 'right': "" }
let g:lightline.tabline_subseparator = { 'left': "/", 'right': "/" }
let g:lightline.subseparator = { 'left': '\\', 'right': '\\' }

let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo'], [ 'tabs' ] ],
            \ 'right': [ [ 'git_branch' ]]
            \ }
let g:lightline.tab = {
        \ 'active': ['filename_with_parent'],
        \ 'inactive': ['filename']
        \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }

let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'vim_logo': "\ue7c5 ",
        \ 'git_branch': '%{Git_branch()}',
        \ 'filename_with_parent': '%t',
        \ 'status_diagnostic': '%{StatusDiagnostic()}',
        \ 'testing_status': '%{TestingStatus()}'
        \ }


