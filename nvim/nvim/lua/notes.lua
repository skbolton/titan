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
    ['core.presenter'] = {
      config = {
        zen_mode = 'zen-mode'
      }
    },
    ['core.export'] = {},
    ['core.integrations.nvim-cmp'] = {},
    ['core.norg.concealer'] = {
      config = {
        icon_preset = "diamond",
        dim_code_blocks = {
          -- enabled = false,
          conceal = false
        }
      }
    }
  }
}
