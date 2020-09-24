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

let g:vista_default_executive = 'coc'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_popup = 1
let g:completion_auto_change_source = 1

let g:completion_chain_complete_list = [
      \    {'complete_items': ['lsp']},
      \    {'complete_items': ['buffers']},
      \    {'mode': '<c-p>'},
      \    {'mode': '<c-n>'}
      \  ]

autocmd BufEnter * lua require'completion'.on_attach()
