return {
  {
    'jiangmiao/auto-pairs',
    config = function()
      vim.g.AutoPairsMapSpace = 0
    end
  },
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-repeat',
  'tpope/vim-endwise',
  'tpope/vim-speeddating',
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },
  'yuttie/comfortable-motion.vim',

  -- Completion, Navigation, Linters, Fixers
  {
    'christoomey/vim-tmux-navigator',
    config = function ()
      vim.g.tmux_navigator_disable_when_zoomed = true
    end
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('linting')
    end
  },
  {
    'mattn/emmet-vim',
    ft = {'svelte', 'html', 'heex', 'elixir', 'javascript'},
    config = function()
      vim.g.user_emmet_settings = {
        ['javascript.jsx'] = {
          extends = 'jsx',
        },
        elixir = {
          extends = 'html'
        },
        eelixir = {
          extends = 'html'
        },
        heex = {
          extends = 'html'
        }
      }
      vim.g.user_emmet_mode = 'inv'
    end
  },
  {
   'norcalli/nvim-colorizer.lua',
   config = true
  },
  {
    'glacambre/firenvim',
    cond = function()
      return vim.g.started_by_firenvim
    end,
    build = function() vim.fn['firenvim#install'](0) end
  }
}
