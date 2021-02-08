--[[
 ______   _____    __   ______  ______   ______             
/\  ___\ /\  __-. /\ \ /\__  _\/\  __ \ /\  == \            
\ \  __\ \ \ \/\ \\ \ \\/_/\ \/\ \ \/\ \\ \  __<            
 \ \_____\\ \____- \ \_\  \ \_\ \ \_____\\ \_\ \_\          
  \/_____/ \/____/  \/_/   \/_/  \/_____/ \/_/ /_/          
 ______   ______  ______  __   ______   __   __   ______    
/\  __ \ /\  == \/\__  _\/\ \ /\  __ \ /\ "-.\ \ /\  ___\   
\ \ \/\ \\ \  _-/\/_/\ \/\ \ \\ \ \/\ \\ \ \-.  \\ \___  \  
 \ \_____\\ \_\     \ \_\ \ \_\\ \_____\\ \_\\"\_\\/\_____\ 
  \/_____/ \/_/      \/_/  \/_/ \/_____/ \/_/ \/_/ \/_____/ 
                                                            
--]]

-- instead of `set option=...`
local o = vim.o
-- for options that are local to a window
local wo = vim.wo

-- SPACING AND INDENTATION
-- ===================================================================
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.wrap = true
o.linebreak = true

-- UI CONFIG
-- ===================================================================
-- gutters, line numbers, searching
o.termguicolors = true
o.encoding = "utf8"
o.number = true
o.relativenumber = true
o.ruler = true
o.cursorline = true
-- when typing a bracket highlight the match
o.showmatch = true
-- no idea what this does?
o.list = true
-- list chars for 'hidden' characters
wo.lcs = "extends:❯,precedes:❮,tab:>-"
-- alsways show symbol gutter (I hate seeing the editor shift)
wo.signcolumn = 'yes'
-- highlight words that match / search
o.hlsearch = true
-- start hlsearch as I type
o.incsearch = true
-- search case insensitive until I add a capital letter
o.smartcase = true
-- show effects of substitution as I perform it
o.inccommand = "nosplit"
-- Don't show what mode I am in
-- My statusline will tell me this not the editor
o.showmode = false
-- how often to poll for updates
-- affects things like gutter symbols
o.updatetime = 300
o.lazyredraw = true
-- fix the crazy default behavior of how splits are created
o.splitbelow = true
o.splitright = true
-- MENUS
o.wildmenu = true
o.completeopt = "menuone,noselect,noinsert"
o.history = 100

-- FOLDING
-- ===================================================================
o.foldenable = true
o.foldlevelstart = 10
o.foldnestmax = 10

-- BACKUP/SWAP
-- ===================================================================
-- I also like to live dangerously
o.backup = false
o.writebackup = false
o.swapfile = false
