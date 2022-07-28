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
  ensure_installed = {'beancount', 'elixir', 'markdown', 'markdown_inline'},
  highlight = {
    enable = true,
    disable = {'elixir'},
    additional_vim_regex_highlighting = {'markdown'}
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookbehind = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ic"] = "@comment.inner",
        ["ac"] = "@comment.outer",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["am"] = "@class.outer",
        ["im"] = "@class.inner",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer"
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

