lua require 'lsp'

let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

let g:vista_icon_indent = ["▸ ", ""]

let g:vista#renderer#icons = {
\   "function": "ﬦ",
\   "module": " ",
\   "variable": " ",
\   "constant": ""
\  }

let g:vista_default_executive = 'nvim_lsp'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_popup = 1
let g:completion_auto_change_source = 1
let g:completion_trigger_character = ['.', '"']
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_confirm_key = "\<c-y>"

let g:completion_chain_complete_list = {
      \  'default': [
      \      {'complete_items': ['lsp']},
      \      {'complete_items': ['buffers']},
      \      {'mode': '<c-p>'},
      \      {'mode': '<c-n>'}
      \  ],
      \  'sql': [
      \    {'complete_items': ['vim-dadbod-completion']}
      \  ]
      \}

augroup completion
  autocmd!
  autocmd BufEnter * lua require'completion'.on_attach()
  autocmd FileType sql let g:completion_trigger_character = ['.', '"']
augroup END

