local bmap = vim.api.nvim_buf_set_keymap
local blocal = vim.opt_local
local capabilities = require 'lsp_capabilities'()

bmap(0, 'n', '<localleader>d', ':silent !xdg-open https://hexdocs.pm/', {noremap = true})

local executable = vim.loop.os_homedir() .. "/.local/share/elixir-ls/rel/language_server.sh"

if vim.fn.executable(executable) then
  vim.lsp.start {
    name = 'elixirls',
    cmd = { executable },
    capabilities = capabilities,
    root_dir = vim.fs.dirname(vim.fs.find({'mix.exs', '.git'}, { upward = true })[1]),
    settings = {
      elixirLS = {
        dialyzerEnabled = true;
      }
    }
  }
end

