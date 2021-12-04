local tree = require('nvim-tree')

vim.g.nvim_tree_show_icons = {
   git = 0,
   folders = 1,
   files = 1,
};

vim.g.nvim_tree_icons = {
   default = '',
   symlink = '',
   git = {
     unstaged = "✗",
     staged = "✓",
     unmerged = "",
     renamed = "➜",
     untracked = "★"
   },
   folder = {
     default = " ",
     open = " "
   }
}

vim.g.nvim_tree_width_allow_resize = true;

tree.setup {
  disable_netrw = false,
  git = {
    enable = false
  }
}
