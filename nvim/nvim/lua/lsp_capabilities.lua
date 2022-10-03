local has_cmp_lsp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')

local capabilities = nil

if(has_cmp_lsp) then
  capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
else
  capabilities = vim.lsp.protocol.make_client_capabilities()
end

return function() return capabilities end
