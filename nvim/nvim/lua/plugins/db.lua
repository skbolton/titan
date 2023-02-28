return {
  'tpope/vim-dadbod',
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion'
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = true
    vim.g.db_ui_execute_on_save = false
    vim.g.db_ui_save_location = "./steve_queries"
    vim.g.db_ui_disable_mappings = true
    vim.g.db_url = os.getenv("DBUI_URL")
  end
}
