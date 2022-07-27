vim.g.vimwiki_folding = 'syntax';

-----------------------------------------------------------------------
-- WIKIS
-----------------------------------------------------------------------

local gb = {
  name = 'GenesisBlock',
  path = "~/Documents/GenesisBlock",
  syntax = "markdown",
  ext = ".md",
  automatic_nested_syntaxes = 1
}

vim.g.vimwiki_list = {delta, gb}


-----------------------------------------------------------------------
-- Peripheral configuration
-----------------------------------------------------------------------

vim.g.mkdp_page_title = '${name}'

-- Vim Zettel
vim.g.zettel_format = "%y%m%d-%H%M"
vim.g.zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "

-- taskwiki
vim.g.taskwiki_maplocalleader="-t"
vim.g.taskwiki_data_location="~/.local/share/task"

-- TODO: Port to lua
-- function TaskSearch()
--  let line = getline('.')
--  let task_id = split(line, "#")[1]
--  execute 'silent lgrep -g "!index.md" ' . task_id . ' ~/Documents/sync/Knowledge/'
-- endfunction
