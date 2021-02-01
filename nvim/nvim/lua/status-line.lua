local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista_kind','dbui'}

local colors = {
  space0 = "#100E23",
  space1 = "#1e1c31",
  space2 = "#2D2B40",
  space3 = "#3E3859",
  space4 = "#585273",
  astral0 ="#8A889D",
  astral1 ="#cbe3e7",
  red = "#F48FB1",
  dark_red = "#F02E6E",
  green = "#A1EFD3",
  dark_green = "#62d196",
  yellow = "#ffe6b3",
  dark_yellow = "#F2B482",
  blue = "#91ddff",
  dark_blue = "#65b2ff",
  purple = "#d4bfff",
  dark_purple ="#a37acc",
  cyan = "#87DFEB",
  dark_cyan = "#63f2f1"
}

-- helper functions
local buffer_not_empty = function() 
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local server_attached = function()
  return vim.lsp.buf_get_clients()[1] ~= nil
end

local active_lsp = function()
  active_client = vim.lsp.buf_get_clients()[1]
  if active_client ~= nil then
    return '鷺' .. active_client.name
  end

  return '鷺----'
end

local testing_results = function()
  local test_colors = {
    passing = colors.blue,
    running = colors.yellow,
    failing = colors.red
  }

  vim.api.nvim_command('hi GalaxyTestResults guifg=' ..test_colors[vim.g.TESTING_STATUS])

  if vim.g.TESTING_STATUS == 'passing' then
    return "∙ PASS"
  elseif vim.g.TESTING_STATUS == 'running' then
    return "∙ CHECK"
  elseif vim.g.TESTING_STATUS == 'failing' then
    return "∙ FAIL"
  end
end

-----------------------------------------------------------
-- Bar Sections
-----------------------------------------------------------

-- LEFT
-----------------------------------------------------------
gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according to vim mode
      local mode_color = {
        -- normal
        n = colors.cyan,
        no = colors.cyan,
        -- selection
        s = colors.dark_yellow,
        -- insert
        i = colors.red,
        -- visual
        V = colors.yellow,
        v = colors.yellow,
        c = colors.purple,
        -- terminal
        t = colors.green
      }

      local alias = {
        n      = 'NORMAL',
        i      = 'INSERT',
        v      = 'VISUAL',
        V      = 'V·LINE',
        c      = 'COMMAND',
        R      = 'REPLACE',
        Rv     = 'V·REPLACE',
        t      =  'TERM',
        ['!']  =  'SHELL'
      }

      local mode = vim.fn.mode();
      local color = mode_color[mode] or colors.yellow
      local alias = alias[mode] or ''
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. color)

      return ' ' .. alias
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.space1},
    highlight = {colors.green, colors.space1,  'bold'}
  }
}

gls.left[2] = {
  FileSize = {
    provider = 'FileSize',
    condition = buffer_not_empty,
    highlight = {colors.astral1, colors.space1}
  }
}

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  }
}

gls.left[4] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    highlight = {colors.green ,colors.bg,'bold'}
  }
}

gls.left[5] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.space1},
    highlight = {colors.astral0, colors.space1},
  },
}

-- RIGHT
-----------------------------------------------------------
gls.right[1] = {
  TestResults = {
    provider = testing_results,
    separator = ' ',
    separator_highlight = {'NONE',colors.space1},
    highlight = {colors.yellow, colors.space1}
  }
}

gls.right[2] = {
  LanguageServer = {
    provider = active_lsp,
    separator = ' ',
    separator_highlight = {'NONE', colors.space1},
    highlight = {colors.green, colors.space1}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.space1},
    highlight = {colors.purple,colors.space1},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.purple,colors.space1}
  }
}

-- SHORTLINE
-----------------------------------------------------------
gls.short_line_left[1] = {
  FileName = {
    provider = 'FileName',
    highlight = {colors.green, colors.space1}
  }
}
