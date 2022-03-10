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
  ensure_installed = {'beancount', 'elixir'},
  highlight = {
    enable = true,
    disable = {'elixir'}
  },
  textobjects = {
    select = {
      enable = true,
      lookbehind = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }
    },
    move = {
      enable = true,
      set_jumps = false,
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
      },
    },
  }
}

