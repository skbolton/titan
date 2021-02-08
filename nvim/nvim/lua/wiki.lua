vim.g.vimwiki_folding = 'syntax';

-----------------------------------------------------------------------
-- WIKIS
-----------------------------------------------------------------------

-- Wolf - personal improvement and character workspace
local wolf = {
  path = "~/Documents/knowledge/wolf",
  syntax = "markdown",
  ext = '.md',
  links_space_char = '_',
  auto_diary_index = 1,
  automatic_nested_syntaxes = 1
}

-- Genesis Block - Workspace for genesis related stuff
local genesis = {
  path = '~/Documents/knowledge/genesis',
  syntax = 'markdown',
  ext = '.md',
  links_space_char = '_',
  auto_diary_index = 1,
  automatic_nested_syntaxes = 1,
  diary_header = 'Daily Notes',
  diary_rel_path = 'dailies/',
  diary_index = 'index'
}

-- Delta - Zettelkasten style PKM

vim.g.vimwiki_list = {wolf, genesis}


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

-- TODO: Port to lua
-- function TaskSearch()
--  let line = getline('.')
--  let task_id = split(line, "#")[1]
--  execute 'silent lgrep -g "!index.md" ' . task_id . ' ~/Documents/sync/Knowledge/'
-- endfunction
