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

-- Set editor options in lua
-- instead of `set option=...`
-- Unlike vim, for buffer or window options we also need to set
-- the global table or else only the first buffer/window will
-- have the option
--
-- To see if an option is global, buffer, or window scoped you
-- have to run :help <option> and see before its description 
-- what option it is.
--
-- Here is an excert of `:help expandtab`
--  'expandtab' 'et'	boolean	(default off)
--    local to buffer <- HERE
--  In Insert mode: Use the appropriate number of spaces to insert a
--
-- Usage:
-- opt('g', 'termguicolors', true)
-- opt('b', 'softtabstop', 2)
-- opt('w', 'wrap', true)
local function opt(scope, key, value)
  local scopes = {g = vim.o, b = vim.bo, w = vim.wo}

  scopes[scope][key] = value
  if scope ~= 'g' then scopes['g'][key] = value end
end

-- SPACING AND INDENTATION
-- ===================================================================
opt('b', 'tabstop', 2)
opt('b', 'softtabstop', 2)
opt('b', 'shiftwidth', 2)
opt('b', 'expandtab', true)
opt('b', 'smartindent', true)
opt('b', 'autoindent', true)
opt('w', 'wrap', true)
opt('w', 'linebreak', true)

-- UI CONFIG
-- ===================================================================
-- gutters, line numbers, searching
opt('g', 'termguicolors', true)
opt('g', 'encoding', "utf8")
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('g', 'ruler', true)
opt('g', 'cursorline', true)
-- when typing a bracket highlight the match
opt('g', 'showmatch', true)
-- no idea what this does?
opt('g', 'list', true)
-- list chars for 'hidden' characters
opt('w', 'lcs', "extends:❯,precedes:❮,tab:>-")
-- alsways show symbol gutter (I hate seeing the editor shift)
opt('w', 'signcolumn', 'yes')
-- highlight words that match / search
opt('g', 'hlsearch', true)
-- start hlsearch as I type
opt('g', 'incsearch', true)
opt('g', 'ignorecase', true)
-- search case insensitive until I add a capital letter
opt('g', 'smartcase', true)
-- show effects of substitution as I perform it
opt('g', 'inccommand', "nosplit")
-- Don't show what mode I am in
-- My statusline will tell me this not the editor
opt('g', 'showmode', false)
-- how often to poll for updates
-- affects things like gutter symbols
opt('g', 'updatetime', 300)
opt('g', 'lazyredraw', true)
-- fix the crazy default behavior of how splits are created
opt('g', 'splitbelow', true)
opt('g', 'splitright', true)
-- MENUS
opt('g', 'wildmenu', true)
opt('g', 'completeopt', "menuone,noselect,noinsert")
opt('g', 'history', 100)

-- FOLDING
-- ===================================================================
opt('g', 'foldenable', true)
opt('g', 'foldlevelstart', 10)
opt('g', 'foldnestmax', 10)

-- BACKUP/SWAP
-- ===================================================================
-- I also like to live dangerously
opt('g', 'backup', false)
opt('g', 'writebackup', false)
opt('g', 'swapfile', false)
