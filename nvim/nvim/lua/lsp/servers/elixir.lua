local nvim_lsp = require 'lspconfig'

local _M = {}

function _M.init(capabilities, on_attach)
  return nvim_lsp.elixirls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {
      vim.loop.os_homedir() .. "/.local/share/elixir-ls/rel/language_server.sh"
    };
    settings = {
      elixirLS = {
        dialyzerEnabled = true;
      }
    }
  }
end

return _M
