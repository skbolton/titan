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
    requires = {
      {
        'lukas-reineke/headlines.nvim',
        config = function()
          require('headlines').setup {
            markdown = {
              dash_string = "─",
              fat_headlines = false
            },
            norg = {
              fat_headlines = false
            }
          }
        end
      },
      { 'folke/zen-mode.nvim' }
    },
    config = function() require 'notes' end
  }
  use {
    'tpope/vim-dadbod',
    requires = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion'
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_execute_on_save = false
      vim.g.db_ui_save_location = "./steve_queries"
      vim.g.db_ui_disable_mappings = true
      vim.g.db_url = os.getenv("DBUI_URL")
    end
  }

  -- Git
  use {
    'tpope/vim-fugitive',
    event = 'VimEnter',
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
    event = "VimEnter",
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require 'git'
    end
  }
  
  -- Editing
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-endwise'
  use 'tpope/vim-speeddating'
  use 'ggandor/lightspeed.nvim'
  use 'yuttie/comfortable-motion.vim'

  -- Completion, Navigation, Linters, Fixers
  use {
    'christoomey/vim-tmux-navigator',
    config = function ()
      vim.g.tmux_navigator_disable_when_zoomed = true
    end
  }

  use {
    'mickael-menu/zk-nvim',
    after = 'nvim-cmp',
    config = function()
      local zk = require('zk')
      local commands = require('zk.commands')

      commands.add("ZkSpells", function(options)
        options = vim.tbl_extend("force", { dir = "Cortex", tags = {"spell"} }, options or {})
        zk.edit(options, { title = "Spellbook" })
      end)

      zk.setup {
        picker = "telescope",
        lsp = {
          config = {
            on_attach = on_attach
          },
          auto_attach = {
            enabled = true
          }
        }
      }
    end
  }

  use {
    'mfussenegger/nvim-lint',
    config = function()
      require('linting')
    end
  }

  use {'liuchengxu/vista.vim', cmd = 'Vista'}

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lua',
      'onsails/lspkind-nvim'
    },
    config = function()
      require('complete')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground'
    },
    config = function() require("tree-sitter") end
  }
  use 'tpope/vim-projectionist'
  use {
    'janko/vim-test',
    requires = {
      'tpope/vim-dispatch',
      'neomake/neomake',
      'preservim/vimux'
    }
  }
  
  -- UI
  use {'mkarmona/colorsbox', opt = true}

  use {
    'embark-theme/vim',
    cond = function()
      local theme = os.getenv("THEME")
      return theme == 'embark' or theme == nil
    end,
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

  use {
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
  }
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require('neoline') end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'glacambre/firenvim',
    cond = function()
      return vim.g.started_by_nvim
    end,
    run = function() vim.fn['firenvim#install'](0) end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }

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

  -- Language Support Plugins
  -- Markdown
  use {
    'iamcco/markdown-preview.nvim',
    run = ':call mkdp#util#install()',
    ft = {'markdown'}
  }
  use {'blindFS/vim-taskwarrior', fg = {'md', 'vimwiki'}}
  use {
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
  }
  use {'MaxMEllon/vim-jsx-pretty', ft = 'javascript'}
end)

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
