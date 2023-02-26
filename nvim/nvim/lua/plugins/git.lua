return {
  {
    'tpope/vim-fugitive',
    event = 'VimEnter',
    dependencies = {'tpope/vim-rhubarb'}
  },
  {
    'sindrets/diffview.nvim',
    cmd = "DiffviewOpen",
    dependencies = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
    config = true
  },
  {'rhysd/git-messenger.vim', cmd = 'GitMessenger'},
  {
    'lewis6991/gitsigns.nvim',
    event = "VimEnter",
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      require 'git'
    end
  }
}
