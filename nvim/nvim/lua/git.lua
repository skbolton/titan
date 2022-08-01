local gitsigns = require 'gitsigns'

function next_hunk()
  -- Move to next hunk
  gitsigns.next_hunk()
  -- center cursor
  vim.cmd('normal zz')
end

function prev_hunk()
  -- Move to prev hunk
  gitsigns.prev_hunk()
  -- center cursor
  vim.cmd('normal zz')
end


gitsigns.setup {
  signs = {
    add          = {hl = 'GitGutterAdd'   , text = '│'},
    change       = {hl = 'GitGutterChange', text = '│'},
    delete       = {hl = 'GitGutterDelete', text = '│'},
    topdelete    = {hl = 'GitGutterDelete', text = '│'},
    changedelete = {hl = 'GitGutterDelete', text = '│'},
  },
  on_attach = function(bufnr)
    local map = vim.keymap.set
    local opts = {silent = true}

    map('n', ']g', next_hunk, opts)
    map('n', '[g', prev_hunk, opts)
    map('n', '<leader>g+', gitsigns.stage_hunk, opts)
    map('n', '<leader>g-', gitsigns.undo_stage_hunk, opts)
    map('n', '<leader>g=', gitsigns.reset_hunk, opts)
    map('n', '<leader>gp', gitsigns.preview_hunk, opts)
  end
}
