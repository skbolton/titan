let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

let g:vista_icon_indent = ["▸ ", ""]

let g:vista#renderer#icons = {
\   "function": "ﬦ",
\   "module": " ",
\   "variable": "\ufb18 ",
\   "constant": ""
\  }

let g:vista_default_executive = 'coc'

