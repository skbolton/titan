vim.g.vimwiki_folding = 'syntax';

-----------------------------------------------------------------------
-- WIKIS
-----------------------------------------------------------------------

-- Wolf - personal improvement and character workspace
local wolf = {
  path = "~/Documents/Wolf",
  syntax = "markdown",
  ext = '.md',
  links_space_char = '_',
  automatic_nested_syntaxes = 1,
  index = 'wolf'
}

-- Genesis Block - Workspace for genesis related stuff
local genesis = {
  path = '~/Documents/Warrior/genesis-block',
  syntax = 'markdown',
  ext = '.md',
  links_space_char = '_',
  automatic_nested_syntaxes = 1
}

-- Zettelkasten/Reference Wiki
local wanderer = {
  path = '~/Documents/Wanderer',
  syntax = 'markdown',
  ext = '.md',
  links_space_char = '_',
  automatic_nested_syntaxes = 1
}

vim.g.vimwiki_list = {wolf, genesis, wanderer}


-----------------------------------------------------------------------
-- Peripheral configuration
-----------------------------------------------------------------------

-- Livedown server - markdown previewer
vim.g.livedown_autorun = 0
vim.g.livedown_open = 1
vim.g.livedown_port = 1337

-- Vim Zettel
vim.g.zettel_format = "%y%m%d-%H%M"
vim.g.zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

-- taskwiki
vim.g.taskwiki_maplocalleader="-t"

-- TODO: Port to lua
-- function TaskSearch()
--  let line = getline('.')
--  let task_id = split(line, "#")[1]
--  execute 'silent lgrep -g "!index.md" ' . task_id . ' ~/Documents/sync/Knowledge/'
-- endfunction
