" Author: liuchengxu <xuliuchengxlc@gmail.com>
" Description: Clap theme based on the material_design_dark theme.

let s:save_cpo = &cpoptions
set cpoptions&vim

let s:palette = {}

let s:palette.display = { 'ctermbg': '235', 'guibg': '#100E23' }

" Let ClapInput, ClapSpinner and ClapSearchText use the same backgound.
let s:bg0 = { 'guibg': '#3E3859' }
let s:palette.input = s:palette.display
let s:palette.spinner = extend({ 'guifg':'#63f2f1', 'cterm': 'bold', 'gui': 'bold'}, s:palette.display)
let s:palette.search_text = extend({ 'guifg': '#C6C6C6', 'cterm': 'bold', 'gui': 'bold' }, s:palette.display)

let s:palette.preview = { 'ctermbg': '238', 'guibg': '#3E3859' }

let s:palette.selected = { 'ctermfg': '81', 'guifg': '#5FD7d7', 'cterm': 'bold,underline', 'gui': 'bold,underline' }
let s:palette.current_selection = { 'guibg': '#1e1c31', 'cterm': 'bold', 'gui': 'bold' }
let g:clap_fuzzy_match_hl_groups = [[118 , '#ffe6b3']]

let g:clap#themes#embark#palette = s:palette

let &cpoptions = s:save_cpo
unlet s:save_cpo
