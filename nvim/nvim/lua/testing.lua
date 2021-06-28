local g = vim.g
local v = vim.v

g["test#preserve_screen"] = false
g['test#javascript#jest#options'] = '--reporters jest-vim-reporter'
g.neomake_open_list = true
g['test#strategy'] = {
  nearest = 'neomake',
  file = 'neomake',
  suite = 'neomake'
}
g['test#neovim#term_position'] = 'vert'
g.neomake_warning_sign = {
  text = '∙'
}
g.neomake_error_sign = {
  text = '∙'
}

g.dispatch_compilers = {elixir = 'exunit'}

local M = {}
M.TESTING_STATUS = 'init'

M.neomake_on_job_started = function ()
  M.TESTING_STATUS = 'running'
end

M.neomake_on_job_ended = function ()
  local context = g.neomake_hook_context

  if context.jobinfo.exit_code == 0 then
    M.TESTING_STATUS = 'passing'
  elseif context.jobinfo.exit_code == 1 then
    M.TESTING_STATUS = 'failing'
  end
end

-- AUTOCOMMANDS
vim.cmd([[
  augroup my_neomake_hooks
    au!
    autocmd User NeomakeJobFinished call luaeval("require('testing').neomake_on_job_ended()")
    autocmd User NeomakeJobStarted call luaeval("require('testing').neomake_on_job_started()")
  augroup END
]])


return M
