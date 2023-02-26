return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'nvim-telescope/telescope-bibtex.nvim'},
    {'nvim-telescope/telescope-symbols.nvim'}
  },
  config = function()
    require 'fuzzy'
  end
}
