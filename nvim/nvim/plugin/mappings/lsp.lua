local nest = require('nest')

nest.applyKeymaps {
  {
    'leader', {
      'l', {
        { 'd', '<CMD>lua vim.lsp.buf.definition()<CR>' },
        {'D', ':vsp <BAR> :lua vim.lsp.buf.definition()<CR>zz'},
        {'s', '<CMD>lua vim.lsp.buf.signature_help()<CR>'},
        {'h', '<CMD>lua vim.lsp.buf.hover()<CR>'},
        {'f', '<CMD>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>'},
        {'o', '<CMD>Vista finder skim<cr>'},
        {'[', '<CMD>lua vim.lsp.diagnostic.goto_prev({ wrap = true })<CR>'},
        {']', '<CMD>lua vim.lsp.diagnostic.goto_next({ wrap = true })<CR>'},
        {'=', '<CMD>lua vim.lsp.diagnostic.show_line_diagnostics({})<CR>'},
        {'i', '<CMD>lua vim.lsp.diagnostic.set_loclist()<CR>'},
        {'O', '<CMD>Vista<CR>'},
        {'p', '<CMD>CocList diagnostics<CR>'},
        {'?', '<CMD>CocInfo<CR>'},
        {'r', '<cmd>lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR> :edit<CR>'},
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

