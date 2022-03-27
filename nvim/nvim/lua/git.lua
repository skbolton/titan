local gitsigns = require('gitsigns')

gitsigns.setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '│'},
    change       = {hl = 'GitGutterChange', text = '│'},
    delete       = {hl = 'GitGutterDelete', text = '│'},
    topdelete    = {hl = 'GitGutterDelete', text = '│'},
    changedelete = {hl = 'GitGutterDelete', text = '│'},
  },
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    map('n', ']g', '<cmd>lua require\"gitsigns\".next_hunk()<CR>zz')
    map('n', '[g', '<cmd>lua require\"gitsigns\".prev_hunk()<CR>zz')
    map('n', '<leader>g+', '<cmd>lua require"gitsigns".stage_hunk()<CR>')
    map('n', '<leader>g-', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
    map('n', '<leader>g=', '<cmd>lua require"gitsigns".reset_hunk()<CR>')
    map('n', '<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')
  end
}
