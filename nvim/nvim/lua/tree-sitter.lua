local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

--[[ parser_config.elixir = {
  install_info = {
    -- url = "~/projects/tree-sitter-zimbu", -- local path or git repo
    url = "~/Repos/tree-sitter-elixir", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "ex", -- if filetype does not agrees with parser name
  used_by = {"eex", "exs"} -- additional filetypes that use this parser
} ]]

require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true
  }
}
