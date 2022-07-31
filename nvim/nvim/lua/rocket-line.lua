local testing = require 'testing'
local gl = require 'galaxyline'
local condition = require 'galaxyline.condition'
local gls = gl.section
gl.short_line_list = {'NvimTree','vista_kind','dbui'}

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

-- Customize editor mode name
-- and color per mode
local editor_mode = function ()
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

  local mode_color = {
    n = 'Special',
    no = 'Special',
    s = 'Boolean',
    S = 'Boolean',
    i = 'Keyword',
    ic = 'Keyword',
    V = 'Constant',
    v = 'Constant',
    [""] = 'Boolean',
    c = 'Identifier',
    cv = 'Identifier',
    ce = 'Identifier',
    t = 'PreProc',
    r = 'Identifier',
    R = 'Identifier',
    Rv = 'Identifier',
    ["!"] = 'Identifier',
  }

  local mode = vim.fn.mode()
  vim.api.nvim_command('hi link GalaxyEditorMode ' ..mode_color[mode])

  return alias[mode]
end

-- Read from testing.lua module
-- and adjust icon and color per testing state
local testing_results = function ()
  local test_colors = {
    init = 'Comment',
    passing = 'Type',
    running = 'Constant',
    failing = 'Keyword'
  }

  vim.api.nvim_command('hi link GalaxyTestResults ' ..test_colors[testing.TESTING_STATUS])

  if testing.TESTING_STATUS == 'init' then
    return " "
  elseif testing.TESTING_STATUS == 'passing' then
    return " "
  elseif testing.TESTING_STATUS == 'running' then
    return " "
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
  EditorMode = {
    provider = editor_mode,
    separator = ' '
  }
}

gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = 'Comment'
  }
}

gls.left[4] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require 'galaxyline.provider_fileinfo'.get_file_icon_color,'NONE'},
  }
}

gls.left[5] = {
  FileName = {
    provider = file_name,
    condition = condition.buffer_not_empty,
    highlight = "PreProc"
  }
}

gls.left[6] = {
  LineInfo = {
    provider = function ()
      local line = vim.fn.line('.')
      local column = vim.fn.col('.')
      return string.format("%d:%d", line, column)
    end,
    condition = condition.buffer_not_empty,
    highlight = "Comment",
  },
}

-- RIGHT
-----------------------------------------------------------

gls.right[1] = {
  TestResults = {
    provider = testing_results
  }
}

gls.right[2] = {
  LanguageServer = {
    provider = function()
      active_client = vim.lsp.buf_get_clients()[1]
      if active_client ~= nil then
        vim.api.nvim_command('hi link GalaxyLanguageServer PreProc')
      else
        vim.api.nvim_command('hi link GalaxyLanguageServer Comment')
      end
      return ' '
    end,
    separator = ' ',
    highlight = function()
    end
  }
}

gls.right[3] = {
  GitIcon = {
    -- provider = function() return ' ' end,
    provider = function()
      return ' '
    end,
    separator = ' ',
    highlight = function()
      if condition.check_git_workspace() then
        return "Identifier"
      else
        return "Comment"
      end
    end
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require 'galaxyline.provider_vcs'.check_git_workspace,
    highlight = "Identifier"
  }
}

-- SHORTLINE
-----------------------------------------------------------
gls.short_line_left[1] = {
  FileName = {
    provider = 'FileName',
    highlight = "PreProc"
  }
}

if (os.getenv("NO_SHOW_STATUSLINE")) then
  gls.left = {}
  gls.right = {}
end
