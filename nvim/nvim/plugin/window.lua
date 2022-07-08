local window_group = vim.api.nvim_create_augroup("WindowGroup", { clear = true })

-- highlight text after a yank
vim.api.nvim_create_autocmd("TextYankPost", { pattern = "*", group = window_group, callback = function()
  vim.highlight.on_yank({ timeout = 400 })
end})

-- even out any splits when vim window is resized
vim.api.nvim_create_autocmd("VimResized", { pattern = "*", group = window_group, command = [[exe "normal! \<c-w>=" ]]})
