--[[
 ______  __       __  __   ______   __   __   __   ______    
/\  == \/\ \     /\ \/\ \ /\  ___\ /\ \ /\ "-.\ \ /\  ___\   
\ \  _-/\ \ \____\ \ \_\ \\ \ \__ \\ \ \\ \ \-.  \\ \___  \  
 \ \_\   \ \_____\\ \_____\\ \_____\\ \_\\ \_\\"\_\\/\_____\ 
  \/_/    \/_____/ \/_____/ \/_____/ \/_/ \/_/ \/_/ \/_____/ 
                                                             
--]]

vim.cmd [[packadd packer.nvim]]


local packer = require('packer')
packer.startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  -- ===================================================================

  -- FILETYPE PLUGINS
  use 'elixir-editors/vim-elixir'
  use {
    'vimwiki/vimwiki',
    branch = 'dev',
    config = function()
      require('wiki')
    end
  }
  use 'michal-h21/vim-zettel'
  use 'tbabej/taskwiki'
  use 'saltstack/salt-vim'
  use 'jparise/vim-graphql'
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'
  use 'ledger/vim-ledger'
  -- ===================================================================

  -- CORE PLUGINS
  use 'yuttie/comfortable-motion.vim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-dispatch'
  use 'tpope/vim-endwise'
  use 'tpope/vim-speeddating'
  use 'machakann/vim-highlightedyank'
  use 'janko/vim-test'
  use {
    'christoomey/vim-tmux-navigator',
    config = function ()
      vim.g.tmux_navigator_disable_when_zoomed = true
    end
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  -- Fixers, completion and navigation
  use 'neomake/neomake'
  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp') end,
  }
  use 'nvim-lua/completion-nvim'
  use 'steelsojka/completion-buffers'
  use {
    'dense-analysis/ale',
    config = function()
      require('formatting')
    end
  }
  use {'liuchengxu/vista.vim', cmd = 'Vista'}
  use 'lotabout/skim'
  use 'lotabout/skim.vim'
  -- Status and UI
  use 'kyazdani42/nvim-web-devicons.git'
  use 'kyazdani42/nvim-tree.lua'
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('status-line') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'glacambre/firenvim'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-web-devicons'}},
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')
      -- configure telescope
      telescope.setup{
        defaults = {
          prompt_position = 'top',
          prompt_prefix = '  ',
          sorting_strategy = 'ascending'
        }
      }
    end
  }
  -- Git
  use {
    'tpope/vim-fugitive',
    requires = {'tpope/vim-rhubarb'}
  }
  use {'rhysd/git-messenger.vim', cmd = 'GitMessenger'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('git')
    end
  }
  use 'justinmk/vim-sneak'
  use 'kana/vim-textobj-user'
  -- ===================================================================

  -- THEMES
  use {'gruvbox-material/vim', opt = true, as = 'gruvbox-material'}
  use {'mkarmona/colorsbox', opt = true}
  use {'embark-theme/vim', opt = true, as = 'embark'}
  -- ===================================================================

  -- SUPPORT PLUGINS
  -- These don't have to be loaded up front
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'tpope/vim-dadbod'
  -- Markdown
  use {'shime/vim-livedown', ft = {'md', 'vimwiki'}}
  use {'junegunn/goyo.vim', ft = {'md', 'vimwiki'}}
  use {'blindFS/vim-taskwarrior', fg = {'md', 'vimwiki'}}
  -- Javascript
  use {'mattn/emmet-vim', ft = {'svelte', 'html', 'elixir', 'javascript'}}
  use {'MaxMEllon/vim-jsx-pretty', ft = 'javascript'}
  use {'heavenshell/vim-jsdoc', ft = 'javascript'}
  -- Elixir
  use {'andyl/vim-textobj-elixir', ft = 'elixir'}
end)

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
