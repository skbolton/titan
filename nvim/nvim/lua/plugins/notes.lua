return {
  {
    'nvim-neorg/neorg',
    dependencies = {
      {
        'lukas-reineke/headlines.nvim',
        config = function()
          require('headlines').setup {
            markdown = {
              dash_string = "─",
              fat_headlines = false
            },
            norg = {
              fat_headlines = false
            }
          }
        end
      },
      { 'folke/zen-mode.nvim' },
      {'nvim-treesitter/nvim-treesitter'}
    },
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              delta = "~/Documents/Delta",
              journal = "~/Documents/Delta/Journal",
            },
            autochdir = true
          }
        },
        ['core.completion'] = {
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
        ['core.concealer'] = {
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
  },
  {
  'mickael-menu/zk-nvim',
    dependencies = 'nvim-cmp',
    config = function()
      local zk = require('zk')
      local util = require('zk.util')
      local commands = require('zk.commands')

      zk.setup {
        picker = "telescope",
        lsp = {
          config = {
            on_attach = on_attach
          },
          auto_attach = {
            enabled = true
          }
        }
      }
      -- CUSTOM COMMANDS
      commands.add("ZkOpenNotes", function(options)
        options = vim.tbl_extend("force", { excludeHrefs = {os.getenv("ZK_NOTEBOOK_DIR") .. "/Logbook"} }, options or {})
        zk.edit(options, { title = "Reference" })
      end)

      -- CUSTOM COMMANDS
      commands.add("ZkSpells", function(options)
        options = vim.tbl_extend("force", { dir = "Ref", tags = {"spell"} }, options or {})
        zk.edit(options, { title = "Spellbook" })
      end)
    end
  }
}
