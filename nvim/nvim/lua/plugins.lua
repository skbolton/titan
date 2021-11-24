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
  use 'lfe-support/vim-lfe'
  use {
    'vimwiki/vimwiki',
    branch = 'dev',
    config = function()
      require('wiki')
    end
  }
  use 'tbabej/taskwiki'
  use 'saltstack/salt-vim'
  use 'jparise/vim-graphql'
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'
  use 'ledger/vim-ledger'
  use 'hashivim/vim-terraform'
  use 'skbolton/moonshot.nvim'
  -- ===================================================================

  -- CORE PLUGINS
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require("tree-sitter") end,
    branch = '0.5-compat'
  }
  use 'LionC/nest.nvim'
  use 'wakatime/vim-wakatime'
  use 'yuttie/comfortable-motion.vim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-projectionist'
  use 'tpope/vim-endwise'
  use 'tpope/vim-speeddating'
  use {
    'janko/vim-test',
    requires = { 'tpope/vim-dispatch', 'neomake/neomake', 'preservim/vimux' }
  }
  use {
    'christoomey/vim-tmux-navigator',
    config = function ()
      vim.g.tmux_navigator_disable_when_zoomed = true
    end
  }
  use {
    'folke/todo-comments.nvim',
    config = function()
      require'todo-comments'.setup{
        signs = true,
        keywords = {
          TASK = {icon = " ", color = "purple"},
          IDEA = {icon = ' ', color = "green"},
          TODO = {icon = " ", color = "yellow"},
          FIX = {icon = " ", color = "red"}
        },
        colors = {
          purple = "Type",
          green = "PreProc",
          yellow = "TODO",
          red = "Keyword"
        }
      }
    end
  }
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  -- Fixers, completion and navigation
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require'compe'.setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'enable',
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,
        source = {
          path = true,
          buffer = true,
          calc = true,
          nvim_lsp = true,
          nvim_lua = true,
          vim_dadbod_completion = true,
          vsnip = true
        }
      }
    end
  }
  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp') end,
  }
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
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('tree') end
  }
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('neoline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
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
          layout_config = {
            prompt_position = 'top',
          },
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
  use 'ggandor/lightspeed.nvim'
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
  -- use {'shime/vim-livedown', ft = {'md', 'vimwiki'}}
  use {
    'iamcco/markdown-preview.nvim',
    run = ':call mkdp#util#install()'
  }
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
