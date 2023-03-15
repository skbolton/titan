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
    'sainnhe/everforest',
    cond = function()
      return os.getenv('THEME') == 'everforest'
    end,
    config = function()
      vim.g.everforest_background = 'hard'
      vim.cmd.colorscheme 'everforest'
    end
  },
  {
    'folke/tokyonight.nvim',
    cond = function()
      return os.getenv('THEME') == 'tokyonight-day'
    end,
    config = function()
      require 'tokyonight'.setup {
        style = 'day',
        on_highlights = function(hl, c)
          hl["@text.todo"] = {
            bg = c.purple,
            fg = "#000000"
          }
        end

      }
      vim.cmd('colorscheme tokyonight')
    end
  },
  {'mkarmona/colorsbox'}
}
