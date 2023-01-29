local telescope = require 'telescope'
local builtin = require 'telescope.builtin'

local map = vim.keymap.set

map('n', '<leader>_', builtin.live_grep)
map('n', '<leader><leader>', builtin.find_files)
map('n', '<leader><Backspace>', builtin.buffers)
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fr', builtin.buffers)
map('n', '<leader>gf', builtin.git_status)
map('n', '<leader>gB', builtin.git_branches)
map('n', '<leader><leader>', builtin.find_files)
map('n', '<leader><Backspace>', builtin.buffers)
map('n', '<leader>ff', builtin.find_files)
map('n', '<leader>fr', builtin.buffers)
map('n', '<leader>fm', builtin.man_pages)
map('n', '<leader>nn', '<CMD>ZkNotes { excludeHrefs = {os.getenv("ZK_NOTEBOOK_DIR") .. "/Logbook"} }<CR>')
map('n', '<leader>nN', '<CMD>ZkNotes<CR>')
map('n', '<leader>nt', '<CMD>ZkTags<CR>')
map('n', '<leader>ns', '<CMD>ZkTags { dir = "Ref", tags = {"spell"} }<CR>')
map('n', '<leader>n.', '<CMD>ZkBacklinks<CR>')
map('v', '<leader>zn', ":'<,'>ZkNewFromTitleSelection { dir = 'Logbook' }<CR>")
map('v', '<leader>zr', ":'<,'>ZkNewFromTitleSelection { dir = 'Ref' }<CR>")
map('v', '<leader>zN', ":'<,'>ZkNewFromContentSelection { title = vim.fn.input('Title: '), dir = vim.fn.input('Dir: ') }<CR>")
map('n', '<leader>fi', '<CMD>Telescope symbols<CR>')

telescope.setup{
  defaults = {
    layout_config = {
      prompt_position = 'top',
    },
    prompt_prefix = '  ',
    sorting_strategy = 'ascending',
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    }
  },
  pickers = {
    find_files = {
      find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
      layout_config = {
        height = 0.70
      }
    },
    buffers = {
      show_all_buffers = true
    },
    live_grep = {
      theme = "ivy"
    },
    git_status = {
      git_icons = {
        added = "+",
        changed = "~",
        copied = "",
        deleted = "-",
        renamed = ">",
        unmerged = "^",
        untracked = "?",
      },
      theme = "ivy"
    }
},
extensions = {
  bibtex = {
    global_files = { os.getenv("HOME") .. "/Documents/Notes/Resources/global.bib" }
  }
}
}

telescope.load_extension('fzf')
telescope.load_extension('bibtex')
