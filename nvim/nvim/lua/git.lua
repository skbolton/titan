local gitsigns = require('gitsigns')

gitsigns.setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '│'},
    change       = {hl = 'GitGutterChange', text = '│'},
    delete       = {hl = 'GitGutterDelete', text = '│'},
    topdelete    = {hl = 'GitGutterDelete', text = '│'},
    changedelete = {hl = 'GitGutterDelete', text = '│'},
  },
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n <leader>g>'] = '<cmd>lua require\"gitsigns\".next_hunk()<CR>zz',
    ['n <leader>g<'] = '<cmd>lua require\"gitsigns\".prev_hunk()<CR>zz',

    ['n <leader>g+'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>g-'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>g='] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>'
  },
}
