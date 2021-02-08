lua require('testing')

augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call luaeval("require('testing').neomake_on_job_ended()")
  autocmd User NeomakeJobStarted call luaeval("require('testing').neomake_on_job_started()")
augroup END
