vim.g.vimwiki_folding = 'syntax';

-----------------------------------------------------------------------
-- WIKIS
-----------------------------------------------------------------------

-- Delta
local delta = {
  name = 'Delta',
  index = 'Spawn',
  path = "~/Documents/Delta",
  syntax = "markdown",
  ext = ".md",
  automatic_nested_syntaxes = 1,
  diary_rel_path = "Quests/",
  diary_index = "quests",
  diary_header = "Quests",
  auto_diary_index = 1
}

vim.g.vimwiki_list = {delta}


-----------------------------------------------------------------------
-- Peripheral configuration
-----------------------------------------------------------------------

vim.g.mkdp_page_title = '${name}'

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
