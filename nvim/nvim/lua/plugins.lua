vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
--     ____             __ _                      
--   / ___|___  _ __  / _(_) __ _ _   _ _ __ ___ 
--  | |   / _ \| '_ \| |_| |/ _` | | | | '__/ _ \
--  | |__| (_) | | | |  _| | (_| | |_| | | |  __/
--   \____\___/|_| |_|_| |_|\__, |\__,_|_|  \___|
--                          |___/                
--   ____            _                         
--  |  _ \ __ _  ___| | ____ _  __ _  ___ _ __ 
--  | |_) / _` |/ __| |/ / _` |/ _` |/ _ \ '__|
--  |  __/ (_| | (__|   < (_| | (_| |  __/ |   
--  |_|   \__,_|\___|_|\_\__,_|\__, |\___|_|   
--                             |___/           

packer.startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  --    __ _ _      _                            _             _
  --   / _(_) | ___| |_ _   _ _ __   ___   _ __ | |_   _  __ _(_)_ __  ___
  --  | |_| | |/ _ \ __| | | | '_ \ / _ \ | '_ \| | | | |/ _` | | '_ \/ __|
  --  |  _| | |  __/ |_| |_| | |_) |  __/ | |_) | | |_| | (_| | | | | \__ \
  --  |_| |_|_|\___|\__|\__, | .__/ \___| | .__/|_|\__,_|\__, |_|_| |_|___/
  --                    |___/|_|          |_|            |___/
  --  
  -- These plugins have to be required on every boot so that filetypes
  -- exist and other plugins can kick in
  use 'elixir-editors/vim-elixir'
  use {'vimwiki/vimwiki', branch = 'dev'}
  use 'michal-h21/vim-zettel'
  use 'tbabej/taskwiki'
  use 'saltstack/salt-vim'
  use 'jparise/vim-graphql'
  use 'pangloss/vim-javascript'
  use 'evanleck/vim-svelte'
  use 'ledger/vim-ledger'

  --    ____                 ____  _             _
  --   / ___|___  _ __ ___  |  _ \| |_   _  __ _(_)_ __  ___
  --  | |   / _ \| '__/ _ \ | |_) | | | | |/ _` | | '_ \/ __|
  --  | |__| (_) | | |  __/ |  __/| | |_| | (_| | | | | \__ \
  --   \____\___/|_|  \___| |_|   |_|\__,_|\__, |_|_| |_|___/
  --                                       |___/
  --  
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
  use 'christoomey/vim-tmux-navigator'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  -- Fixers, completion and navigation
  use 'neomake/neomake'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'steelsojka/completion-buffers'
  use 'dense-analysis/ale'
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
  use {'norcalli/nvim-colorizer.lua'}
  -- Git
  use 'tpope/vim-fugitive'
  use {'rhysd/git-messenger.vim', cmd = 'GitMessenger'}
  use 'airblade/vim-gitgutter'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-rhubarb'
  use 'justinmk/vim-sneak'
  use 'kana/vim-textobj-user'

  --   _____ _                              
  --  |_   _| |__   ___ _ __ ___   ___  ___ 
  --    | | | '_ \ / _ \ '_ ` _ \ / _ \/ __|
  --    | | | | | |  __/ | | | | |  __/\__ \
  --    |_| |_| |_|\___|_| |_| |_|\___||___/
  --                                        
  use {'arcticicestudio/nord-vim', opt = true}
  use {'sainnhe/lightline_foobar.vim', opt = true}
  use {'gruvbox-material/vim', opt = true, as = 'gruvbox-material'}
  use {'lifepillar/vim-solarized8', opt = true}
  use {'mkarmona/colorsbox', opt = true}
  use {'embark-theme/vim', opt = true, as = 'embark'}

  --   ____                               _     ____  _             _           
  --  / ___| _   _ _ __  _ __   ___  _ __| |_  |  _ \| |_   _  __ _(_)_ __  ___ 
  --  \___ \| | | | '_ \| '_ \ / _ \| '__| __| | |_) | | | | |/ _` | | '_ \/ __|
  --   ___) | |_| | |_) | |_) | (_) | |  | |_  |  __/| | |_| | (_| | | | | \__ \
  --  |____/ \__,_| .__/| .__/ \___/|_|   \__| |_|   |_|\__,_|\__, |_|_| |_|___/
  --              |_|   |_|                                   |___/             
  --  
  -- SQL
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
