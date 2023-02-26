return {
  'glepnir/galaxyline.nvim',
  branch = 'main',
  config = function()
    if os.getenv("NVIM_STATUSLINE") == "rocket-line" then
      require('rocket-line')
    else
      require('neoline')
    end
  end,
  dependencies = {'kyazdani42/nvim-web-devicons'}
}
