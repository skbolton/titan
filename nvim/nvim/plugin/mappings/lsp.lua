local nest = require('nest')
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

nest.applyKeymaps {
  {
    '<leader>', {
      'l', {
        {'d', vim.lsp.buf.definition},
        {'D', definition_in_split},
        {'s', vim.lsp.buf.signature_help },
        {'h', vim.lsp.buf.hover},
        {'f', vim.lsp.buf.formatting_sync},
        {'o', '<CMD>Vista finder skim<cr>'},
        {'[', goto_diagnostic('prev')},
        {']', goto_diagnostic('next')},
        {'=', vim.lsp.diagnostic.show_line_diagnostics},
        {'i', vim.lsp.diagnostic.set_loclist},
        {'O', '<CMD>Vista<CR>'},
        {'p', '<CMD>CocList diagnostics<CR>'},
        {'?', '<CMD>CocInfo<CR>'},
        {'r', reload_lsp_clients},
      }
    }
  },
  {
    mode = 'i', {
      { options = { expr = true }, {
          { '<C-y>', "compe#confirm('<CR>')" },
          { '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"' },
          { '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<TAB>"' }
        }
      }
    }
  }
}

