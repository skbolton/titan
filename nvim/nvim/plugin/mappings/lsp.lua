local lsp = vim.lsp

local reload_lsp_clients = function()
  lsp.stop_client(vim.lsp.get_active_clients())
  -- reload current buffer so that language servers kick in again
  return vim.api.nvim_command('edit!')
end

local definition_in_split = function()
  -- open a split, this will carry the current buffer over
  vim.api.nvim_command('vsp')
  -- go to definition
  lsp.buf.definition()
  -- center cursor
  vim.api.nvim_command('normal zz')
end

-- Go to a diagnostic based on direction
-- Wrapping results causes going back to beginning/end of file
local goto_diagnostic = function(dir)
  if dir == 'next' then
    return function()
      return lsp.diagnostic.goto_next({ wrap = true })
    end
  else
    return function()
      return lsp.diagnostic.goto_prev({ wrap = true })
    end
  end
end

vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>lD', definition_in_split)
vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help )
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting_sync)
vim.keymap.set('n', '<leader>lo', '<CMD>Vista finder skim<cr>')
vim.keymap.set('n', '<leader>l[', goto_diagnostic('prev'))
vim.keymap.set('n', '<leader>l]', goto_diagnostic('next'))
vim.keymap.set('n', '<leader>l=', vim.lsp.diagnostic.show_line_diagnostics)
vim.keymap.set('n', '<leader>li', vim.lsp.diagnostic.set_loclist)
vim.keymap.set('n', '<leader>lO', '<CMD>Vista<CR>')
vim.keymap.set('n', '<leader>lp', '<CMD>CocList diagnostics<CR>')
vim.keymap.set('n', '<leader>l?', '<CMD>CocInfo<CR>')
vim.keymap.set('n', '<leader>lr', reload_lsp_clients)
vim.keymap.set('i', '<C-y>', "compe#confirm('<CR>')", { expr = true })
vim.keymap.set('i', '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { expr = true })
vim.keymap.set('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<TAB>"', { expr = true })

