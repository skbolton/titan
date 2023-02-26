return {
  {
    'embark-theme/vim',
    cond = function()
      local theme = os.getenv("THEME")
      return theme == 'embark' or theme == nil
    end,
    config = function()
      vim.g.embark_terminal_italics = 1
      vim.cmd('colorscheme embark')
    end,
    name = 'embark'
  },
  {
    'folke/tokyonight.nvim',
    cond = function()
      return os.getenv('THEME') == 'tokyonight-day'
    end,
    config = function()
      require 'tokyonight'.setup {
        style = 'day'
      }
      vim.cmd('colorscheme tokyonight')
    end
  },
  {'mkarmona/colorsbox'}
}
