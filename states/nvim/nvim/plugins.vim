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

packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

"    __ _ _      _                            _             _
"   / _(_) | ___| |_ _   _ _ __   ___   _ __ | |_   _  __ _(_)_ __  ___
"  | |_| | |/ _ \ __| | | | '_ \ / _ \ | '_ \| | | | |/ _` | | '_ \/ __|
"  |  _| | |  __/ |_| |_| | |_) |  __/ | |_) | | |_| | (_| | | | | \__ \
"  |_| |_|_|\___|\__|\__, | .__/ \___| | .__/|_|\__,_|\__, |_|_| |_|___/
"                    |___/|_|          |_|            |___/
"  
" These plugins have to be required on every boot so that filetypes
" exist and other plugins can kick in
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('vimwiki/vimwiki', { 'branch': 'dev' })
" Taskwiki has buffer enter events so it has to be available
call minpac#add('tbabej/taskwiki')
call minpac#add('saltstack/salt-vim')
call minpac#add('jparise/vim-graphql')
call minpac#add('pangloss/vim-javascript')

"    ____                 ____  _             _
"   / ___|___  _ __ ___  |  _ \| |_   _  __ _(_)_ __  ___
"  | |   / _ \| '__/ _ \ | |_) | | | | |/ _` | | '_ \/ __|
"  | |__| (_) | | |  __/ |  __/| | |_| | (_| | | | | \__ \
"   \____\___/|_|  \___| |_|   |_|\__,_|\__, |_|_| |_|___/
"                                       |___/
"  
" Most likely plugins that I would want in every session I start

" Utility Things
call minpac#add('yuttie/comfortable-motion.vim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-endwise')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('janko/vim-test')
call minpac#add('wakatime/vim-wakatime')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('SirVer/ultisnips')
call minpac#add('kana/vim-textobj-user')
" Fixers, completion and navigation
call minpac#add('neomake/neomake')
call minpac#add('w0rp/ale')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('liuchengxu/vista.vim')
call minpac#add('ervandew/supertab')
call minpac#add('ctrlpvim/ctrlp.vim')
" Status and UI
call minpac#add('scrooloose/nerdtree')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
call minpac#add('itchyny/lightline.vim')
call minpac#add('itchyny/calendar.vim')
" Git
call minpac#add('tpope/vim-fugitive')
call minpac#add('rhysd/git-messenger.vim')
call minpac#add('niklaas/lightline-gitdiff')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('shumphrey/fugitive-gitlab.vim')
call minpac#add('justinmk/vim-sneak')
"   _____ _                              
"  |_   _| |__   ___ _ __ ___   ___  ___ 
"    | | | '_ \ / _ \ '_ ` _ \ / _ \/ __|
"    | | | | | |  __/ | | | | |  __/\__ \
"    |_| |_| |_|\___|_| |_| |_|\___||___/
"                                        
call minpac#add('challenger-deep-theme/vim', { 'name': 'challenger-deep' })
call minpac#add('ayu-theme/ayu-vim', {'type': 'opt'})
call minpac#add('drewtempelmeyer/palenight.vim', {'type': 'opt'})
call minpac#add('arcticicestudio/nord-vim', {'type': 'opt'})
call minpac#add('dracula/vim', {'type': 'opt', 'name': 'dracula'})
call minpac#add('sainnhe/lightline_foobar.vim', { 'type': 'opt' })
call minpac#add('rakr/vim-two-firewatch', { 'type': 'opt' })

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
call minpac#add('tpope/vim-dadbod', { 'type': 'opt' })
" Markdown
call minpac#add('shime/vim-livedown', {'type': 'opt'})
call minpac#add('junegunn/goyo.vim', {'type': 'opt'})
call minpac#add('blindFS/vim-taskwarrior', { 'type': 'opt' })
" Javascript
call minpac#add('mattn/emmet-vim', { 'type': 'opt' })
call minpac#add('mxw/vim-jsx', { 'type': 'opt' })
call minpac#add('heavenshell/vim-jsdoc', { 'type': 'opt' })
" Elixir
call minpac#add('andyl/vim-textobj-elixir', { 'type': 'opt' })
