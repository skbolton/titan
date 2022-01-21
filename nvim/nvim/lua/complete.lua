local cmp = require('cmp')
local lspkind = require('lspkind')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local kind_icons = {
  Text = ' ',
  Method = ' ',
  Function = ' ',
  Constructor = ' ',
  Field = ' ',
  Variable = ' ',
  Class = ' ',
  Interface = ' ',
  Module = ' ',
  Property = ' ',
  Unit = '',
  Value = '',
  Enum = ' ',
  Keyword = '',
  Snippet = ' ',
  Color = ' ',
  file = ' ',
  Reference = ' ',
  Folder = ' ',
  EnumMember = ' ',
  Constant = ' ',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = ''
}

cmp.setup {
  snippet = {
    -- hook in vsnips
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  formatting = {
    fields = {"kind", "abbr"},
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        vsnip = "[VSnip]",
        nvim_lua = "[Lua]"
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
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    -- shift tab to move backwards
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 }
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  }
}

vim.cmd("hi link CmpItemMenu Comment")
vim.cmd("hi CmpItemAbbrMatch guifg=#CBE3E7 guibg=#2D2B40")
vim.cmd("hi link CmpItemKindDefault Identifier")

vim.cmd("autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })")
