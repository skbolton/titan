"     ____             __ _                      
"   / ___|___  _ __  / _(_) __ _ _   _ _ __ ___ 
"  | |   / _ \| '_ \| |_| |/ _` | | | | '__/ _ \
"  | |__| (_) | | | |  _| | (_| | |_| | | |  __/
"   \____\___/|_| |_|_| |_|\__, |\__,_|_|  \___|
"                          |___/                
"   ____            _                         
"  |  _ \ __ _  ___| | ____ _  __ _  ___ _ __ 
"  | |_) / _` |/ __| |/ / _` |/ _` |/ _ \ '__|
"  |  __/ (_| | (__|   < (_| | (_| |  __/ |   
"  |_|   \__,_|\___|_|\_\__,_|\__, |\___|_|   
"                             |___/           
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  "    __ _ _      _                            _             _
  "   / _(_) | ___| |_ _   _ _ __   ___   _ __ | |_   _  __ _(_)_ __  ___
  "  | |_| | |/ _ \ __| | | | '_ \ / _ \ | '_ \| | | | |/ _` | | '_ \/ __|
  "  |  _| | |  __/ |_| |_| | |_) |  __/ | |_) | | |_| | (_| | | | | \__ \
  "  |_| |_|_|\___|\__|\__, | .__/ \___| | .__/|_|\__,_|\__, |_|_| |_|___/
  "                    |___/|_|          |_|            |___/
  "  
  " These plugins have to be required on every boot so that filetypes
  " exist and other plugins can kick in
  call packager#add('elixir-editors/vim-elixir')
  call packager#add('vimwiki/vimwiki', { 'branch': 'dev' })
  call packager#add('michal-h21/vim-zettel')
  " Taskwiki has buffer enter events so it has to be available
  call packager#add('tbabej/taskwiki')
  call packager#add('saltstack/salt-vim')
  call packager#add('jparise/vim-graphql')
  call packager#add('pangloss/vim-javascript')
  call packager#add('evanleck/vim-svelte')

  "    ____                 ____  _             _
  "   / ___|___  _ __ ___  |  _ \| |_   _  __ _(_)_ __  ___
  "  | |   / _ \| '__/ _ \ | |_) | | | | |/ _` | | '_ \/ __|
  "  | |__| (_) | | |  __/ |  __/| | |_| | (_| | | | | \__ \
  "   \____\___/|_|  \___| |_|   |_|\__,_|\__, |_|_| |_|___/
  "                                       |___/
  "  
  " Most likely plugins that I would want in every session I start

  " Utility Things
  call packager#add('yuttie/comfortable-motion.vim')
  call packager#add('jiangmiao/auto-pairs')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-projectionist')
  call packager#add('tpope/vim-dispatch')
  call packager#add('tpope/vim-endwise')
  call packager#add('machakann/vim-highlightedyank')
  call packager#add('janko/vim-test')
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('SirVer/ultisnips')
  " Fixers, completion and navigation
  call packager#add('neomake/neomake')
  call packager#add('neoclide/coc.nvim', {'branch': 'release'})
  call packager#add('dense-analysis/ale')
  call packager#add('liuchengxu/vista.vim', {'type': 'opt'})
  call packager#add('ervandew/supertab')
  call packager#add('lotabout/skim', { 'dir': '~/.skim', 'do': './install' })
  call packager#add('lotabout/skim.vim')
  " Status and UI
  call packager#add('scrooloose/nerdtree', { 'type': 'opt' })
  call packager#add('ryanoasis/vim-devicons')
  call packager#add('tiagofumo/vim-nerdtree-syntax-highlight', { 'type': 'opt' })
  call packager#add('itchyny/lightline.vim')
  call packager#add('glacambre/firenvim')
  call packager#add('norcalli/nvim-colorizer.lua', { 'type': 'opt' })
  " Git
  call packager#add('tpope/vim-fugitive')
  call packager#add('rhysd/git-messenger.vim', {'type': 'opt'})
  call packager#add('airblade/vim-gitgutter')
  call packager#add('shumphrey/fugitive-gitlab.vim')
  call packager#add('justinmk/vim-sneak')
  call packager#add('kana/vim-textobj-user')
  "   _____ _                              
  "  |_   _| |__   ___ _ __ ___   ___  ___ 
  "    | | | '_ \ / _ \ '_ ` _ \ / _ \/ __|
  "    | | | | | |  __/ | | | | |  __/\__ \
  "    |_| |_| |_|\___|_| |_| |_|\___||___/
  "                                        
  call packager#add('arcticicestudio/nord-vim', {'type': 'opt'})
  call packager#add('sainnhe/lightline_foobar.vim', { 'type': 'opt' })
  call packager#add('gruvbox-material/vim', { 'type': 'opt', 'name': 'gruvbox-material' })
  call packager#add('lifepillar/vim-solarized8', { 'type': 'opt' })
  call packager#add('mkarmona/colorsbox', { 'type': 'opt' })

  "   ____                               _     ____  _             _           
  "  / ___| _   _ _ __  _ __   ___  _ __| |_  |  _ \| |_   _  __ _(_)_ __  ___ 
  "  \___ \| | | | '_ \| '_ \ / _ \| '__| __| | |_) | | | | |/ _` | | '_ \/ __|
  "   ___) | |_| | |_) | |_) | (_) | |  | |_  |  __/| | |_| | (_| | | | | \__ \
  "  |____/ \__,_| .__/| .__/ \___/|_|   \__| |_|   |_|\__,_|\__, |_|_| |_|___/
  "              |_|   |_|                                   |___/             
  "  
  " These plugins are ones that I would only need when working with certain
  " filetypes so they will be required when needed
  "
  " SQL
  call packager#add('tpope/vim-dadbod', { 'type': 'opt' })
  " Markdown
  call packager#add('shime/vim-livedown', {'type': 'opt'})
  call packager#add('junegunn/goyo.vim', {'type': 'opt'})
  call packager#add('blindFS/vim-taskwarrior', { 'type': 'opt' })
  " Javascript
  call packager#add('mattn/emmet-vim', { 'type': 'opt' })
  call packager#add('MaxMEllon/vim-jsx-pretty', { 'type': 'opt' })
  call packager#add('heavenshell/vim-jsdoc', { 'type': 'opt' })
  " Elixir
  call packager#add('andyl/vim-textobj-elixir', { 'type': 'opt' })
endfunction


command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

