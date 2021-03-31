local testing = require('testing')
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local themes = require('themes')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista_kind','dbui'}

local colors = themes.get_theme()

-- helper functions
local buffer_not_empty = function() 
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local function file_readonly()
  if vim.bo.filetype == 'help' then
    return ''
  end
  if vim.bo.readonly == true then
    return '   '
  end
  return ''
end

local file_name = function()
  local file = vim.fn.expand('%:t')
  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly(readonly_icon)
  end
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. '  '
    end
  end
  return file .. ' '
end

local server_attached = function()
  return vim.lsp.buf_get_clients()[1] ~= nil
end

local active_lsp = function()
  active_client = vim.lsp.buf_get_clients()[1]
  if active_client ~= nil then
    vim.api.nvim_command('hi GalaxyLanguageServer guifg=' ..colors.green)
  else
    vim.api.nvim_command('hi GalaxyLanguageServer guifg=' ..colors.fg_dark)
  end

  return ' '
end

local testing_results = function()
  local test_colors = {
    init = colors.fg_dark,
    passing = colors.blue,
    running = colors.yellow,
    failing = colors.red
  }

  vim.api.nvim_command('hi GalaxyTestResults guifg=' ..test_colors[testing.TESTING_STATUS])

  if testing.TESTING_STATUS == 'init' then
    return " "
  elseif testing.TESTING_STATUS == 'passing' then
    return " "
  elseif testing.TESTING_STATUS == 'running' then
    return " "
  elseif testing.TESTING_STATUS == 'failing' then
    return " "
  end
end

-----------------------------------------------------------
-- Bar Sections
-----------------------------------------------------------

-- LEFT
-----------------------------------------------------------
gls.left[1] = {
  Embark = {
    provider = function() return '  ' end,
    separator = ' '
  }
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according to vim mode
      local mode_color = {
        n = colors.cyan,
        no = colors.cyan,
        s = colors.dark_yellow,
        S = colors.dark_yellow,
        i = colors.red,
        ic = colors.red,
        V = colors.yellow,
        v = colors.yellow,
        [""] = colors.dark_yellow,
        c = colors.purple,
        cv = colors.purple,
        ce = colors.purple,
        t = colors.green,
        r = colors.purple,
        R = colors.purple,
        Rv = colors.purple,
        ["!"] = colors.purple,
      }

      local alias = {
        n      = 'NORMAL',
        i      = 'INSERT',
        v      = 'VISUAL',
        [""] = 'V-BLOCK',
        V      = 'V·LINE',
        c      = 'COMMAND',
        r      = 'REPLACE',
        R      = 'REPLACE',
        Rv     = 'V·REPLACE',
        t      = 'TERM',
        ['!']  = 'SHELL',
      }

      local mode = vim.fn.mode();
      local color = mode_color[mode]
      local alias = alias[mode]
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. color)

      return alias
    end,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.green, colors.bg,  'bold'}
  }
}

gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = buffer_not_empty,
    highlight = {colors.fg_dark, colors.bg}
  }
}

gls.left[4] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  }
}

gls.left[5] = {
  FileName = {
    provider = file_name,
    condition = buffer_not_empty,
    highlight = {colors.green ,colors.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    condition = buffer_not_empty,
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg_dark, colors.bg},
  },
}

-- RIGHT
-----------------------------------------------------------

gls.right[1] = {
  TestResults = {
    provider = testing_results,
    -- separator = '',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.yellow, colors.bg}
  }
}

gls.right[2] = {
  LanguageServer = {
    provider = active_lsp,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.green, colors.bg}
  }
}

gls.right[3] = {
  GitIcon = {
    -- provider = function() return ' ' end,
    provider = function()
      if condition.check_git_workspace() then
        vim.api.nvim_command('hi GalaxyGitIcon guifg=' ..colors.purple)
      else
        vim.api.nvim_command('hi GalaxyGitIcon guifg=' ..colors.fg_dark)
      end
      return ' '
    end,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.purple,colors.bg},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = {colors.purple,colors.bg}
  }
}

-- SHORTLINE
-----------------------------------------------------------
gls.short_line_left[1] = {
  FileName = {
    provider = 'FileName',
    highlight = {colors.green, colors.bg}
  }
}

if (os.getenv("NO_SHOW_STATUSLINE")) then
  gls.left = {}
  gls.right = {}
end
