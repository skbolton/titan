return {
  'iamcco/markdown-preview.nvim',
  init = function()
    vim.g.mkdp_theme = 'light'
  end,
  build = ':call mkdp#util#install()',
  ft = {'markdown'}
}
