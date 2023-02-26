return {
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  {'L3MON4D3/LuaSnip', build = "make install_jsregexp"},
  'hrsh7th/cmp-nvim-lua',
  'onsails/lspkind.nvim',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      -- local lspkind = require 'lspkind'
      local luasnip = require 'luasnip'

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end

      local kind_icons = {
        Text = ' ',
        Method = ' ',
        Function = '',
        Constructor = ' ',
        Field = ' ',
        Variable = ' ',
        Class = ' ',
        Interface = ' ',
        Module = ' ',
        Property = ' ',
        Unit = ' ',
        Value = ' ',
        Enum = ' ',
        Keyword = '',
        Snippet = ' ',
        Color = ' ',
        file = ' ',
        Reference = ' ',
        Folder = ' ',
        EnumMember = ' ',
        Constant = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = '',
        TypeParameter = ''
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        formatting = {
          fields = {"kind", "abbr", "menu"},
          format = function(entry, vim_item)
            -- Kind icons
            if entry.source.name == 'vim-dadbod-completion' then
              vim_item.kind = "ﰩ"
            else
              vim_item.kind = kind_icons[vim_item.kind]
            end
            vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              path = "[Path]"
            })[entry.source.name]
            return vim_item
          end
        },
        mapping = {
          -- confirm snippets
          ["<c-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
          },
          -- tab to move down list
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          -- shift tab to move backwards
          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer', keyword_length = 3 }
        },
        experimental = {
          native_menu = false,
          ghost_text = true
        }
      }

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'buffer', keyword_length = 3 }
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline', keyword_length = 3 }
        })
      })

      cmp.setup.filetype('plsql', {
        sources = cmp.config.sources({
          { name = 'vim-dadbod-completion' },
          { name = 'buffer' }
        })
      })

      cmp.setup.filetype('sql', {
        sources = cmp.config.sources({
          { name = 'vim-dadbod-completion' },
          { name = 'buffer' }
        })
      })

      cmp.setup.filetype('norg', {
        sources = cmp.config.sources {
          { name = "neorg" }
        }
      })

      cmp.setup.filetype('lua', {
        sources = cmp.config.sources({
          { name = 'nvim_lua' }
        })
      })
    end
  }
}
