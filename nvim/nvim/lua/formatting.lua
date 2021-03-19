local g = vim.g

g.ale_fixers = {
  javascript = {'prettier', 'eslint'},
  elixir = {'mix_format'}
}

g.ale_linters = {
  javascript = {'eslint'},
  ['javascript.jsx'] = {'eslint'},
  elixir = {'credo'}
}

g.ale_fix_on_save = true
g.ale_lint_on_save = true
g.ale_completion_enabled = false
g.ale_javascript_prettier_use_local_config = 1
g.ale_javascript_eslint_use_local_config = 1
g.ale_elixir_credo_strict = 1
g.ale_sign_error = '∙'
g.ale_sign_warning = '∙'
g.ale_virtualtext_cursor = 1
