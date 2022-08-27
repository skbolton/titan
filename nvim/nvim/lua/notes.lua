local neorg = require 'neorg'

neorg.setup {
  load = {
    ['core.defaults'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          delta = "~/Documents/Delta",
          journal = "~/Documents/Delta/Journal",
        },
        autochdir = true
      }
    },
    ['core.gtd.base'] = {
      config = {
        workspace = "delta"
      }
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp'
      }
    },
    ['core.integrations.nvim-cmp'] = {},
    ['core.norg.concealer'] = {
      config = {
        icons = {
          todo = {
            undone = { icon = " " }
          }
        }
      }
    }
  }
}
