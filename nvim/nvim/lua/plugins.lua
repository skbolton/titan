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
  -- use {
  --   'vimwiki/vimwiki',
  --   branch = 'dev',
  --   config = function()
  --     require('wiki')
  --   end
  -- }
  use 'tbabej/taskwiki'
  use 'saltstack/salt-vim'
  use 'jparise/vim-graphql'
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'
  use 'ledger/vim-ledger'
  use 'hashivim/vim-terraform'
  -- ===================================================================

  -- CORE PLUGINS
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = { 'nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter/playground' },
    config = function() require("tree-sitter") end
  }
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
  -- Fixers, completion and navigation
  use {
    'hrsh7th/nvim-cmp',
    requires = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lua', 'onsails/lspkind-nvim'},
    config = function()
      require('complete')
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
  -- Status and UI
  use {
    'luukvbaal/nnn.nvim',
    config = function()
      local nnn = require("nnn")
      require('nnn').setup {
        mappings = {
          { "<C-t>", nnn.builtin.open_in_tab },       -- open file(s) in tab
          { "<C-s>", nnn.builtin.open_in_split },     -- open file(s) in split
          { "<C-v>", nnn.builtin.open_in_vsplit },    -- open file(s) in vertical split
        }
      }
    end
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
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'kyazdani42/nvim-web-devicons'}, {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}},
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
          sorting_strategy = 'ascending',
        },
        pickers = {
          find_files = {
            find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
            theme = "ivy"
          }
      }
    }

    telescope.load_extension('fzf')
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
end)

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
