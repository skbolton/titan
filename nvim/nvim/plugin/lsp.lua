local lsp = vim.lsp
local map = vim.keymap.set

-- Vista Sidebar
-- ===================================================================
vim.g.vista_sidebar_width = 45;
vim.g.vista_default_executive = 'nvim_lsp';
vim.g.vista_disable_statusline = true;
vim.g['vista#renderer#enable_icon'] = 1;
vim.g.vista_icon_indent = {"▸ ", ""};
vim.g['vista#renderer#icons'] = {
  ['function'] = ' ',
  module = '  ',
  variable = ' ',
  constant = ' ',
  event = ' '
}

-- Helper Functions
-- ===================================================================
local definition_in_split = function()
  -- open a split, this will carry the current buffer over
  vim.api.nvim_command('vsp')
  -- go to definition
  lsp.buf.definition()
  -- center cursor
  vim.api.nvim_command('normal zz')
end

-- LSP Attaching
-- ===================================================================
local formatting_augrop = vim.api.nvim_create_augroup("LSPFORMATTING", {})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buffer = args.buffer
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = formatting_augrop, buffer = buffer })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = formatting_augrop,
        buffer = buffer,
        callback = function() lsp.buf.format() end
      })
    end

    local opts = { buffer = buffer }

    map('n', '<CR>', vim.lsp.buf.definition, opts)
    map('n', '<C-CR>', definition_in_split, opts)
    map('n', '<leader>ls', vim.lsp.buf.signature_help, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<leader>lf', vim.lsp.buf.formatting_sync, opts)
    map('n', '<leader>lo', '<CMD>Telescope lsp_document_symbols<cr>', opts)
    map('n', '<leader>li', vim.diagnostic.setloclist, opts)
    map('n', '<leader>lO', '<CMD>Vista<CR>', opts)
    map('n', '<leader>l?', '<CMD>LspInfo<CR>', opts)
    map('n', '<leader>lr', '<CMD>LspRestart<CR>', opts)
  end
})
