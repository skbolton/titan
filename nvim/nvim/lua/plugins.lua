--[[

░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀░░
░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█░░
░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░

--]]

vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd cfilter]]

local packer = require 'packer'
packer.startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  -- ===================================================================

  -- FILETYPE PLUGINS
  use 'elixir-editors/vim-elixir'
  use 'lfe-support/vim-lfe'
  use 'tbabej/taskwiki'
  use 'saltstack/salt-vim'
  use 'jparise/vim-graphql'
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'
  use 'ledger/vim-ledger'
  use 'hashivim/vim-terraform'
  use 'thesis/vim-solidity'
  use {
    'nvim-neorg/neorg',
    config = function() require 'notes' end
  }
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
    requires = {'mickael-menu/zk-nvim'},
    config = function() require('lsp') end,
  }
  use {
    'mfussenegger/nvim-lint',
    config = function()
      require('linting')
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
      require 'colorizer'.setup()
    end
  }
  
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-bibtex.nvim'},
      {'nvim-telescope/telescope-symbols.nvim'}
    },
    config = function()
      require 'fuzzy'
    end
  }
  -- Git
  use {
    'tpope/vim-fugitive',
    requires = {'tpope/vim-rhubarb'}
  }
  use {
    'sindrets/diffview.nvim',
    cmd = "DiffviewOpen",
    requires = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('diffview').setup()
    end
  }
  use {'rhysd/git-messenger.vim', cmd = 'GitMessenger'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require 'git'
    end
  }
  use 'ggandor/lightspeed.nvim'
  -- ===================================================================

  -- THEMES
  use {'mkarmona/colorsbox', opt = true}
  use {
    'embark-theme/vim',
    config = function()
      vim.g.embark_terminal_italics = 1
      vim.cmd('colorscheme embark')
      vim.cmd('hi link TSLiteral PreProc')
      vim.cmd('hi link TSTextReference Identifier')
      vim.cmd('hi link TSTitle Identifier')
      vim.cmd('hi link TSURI Comment')
    end,
    as = 'embark'
  }
  -- ===================================================================

  -- SUPPORT PLUGINS
  -- These don't have to be loaded up front
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'tpope/vim-dadbod'
  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = ':call mkdp#util#install()',
    ft = {'markdown'}
  }
  use {'junegunn/goyo.vim', ft = {'md', 'vimwiki'}}
  use {'blindFS/vim-taskwarrior', fg = {'md', 'vimwiki'}}
  -- Javascript
  use {'mattn/emmet-vim', ft = {'svelte', 'html', 'elixir', 'javascript'}}
  use {'MaxMEllon/vim-jsx-pretty', ft = 'javascript'}
  use {'heavenshell/vim-jsdoc', ft = 'javascript'}
end)

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
