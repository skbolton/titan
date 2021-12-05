include:
  - zk
  - finances

nvim:
  pkg.installed:
    - name: neovim

old-configs-gone:
  file.absent:
    - name: {{ pillar['xdg_config_home'] }}/nvim

nvim-config:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/nvim
    - source: salt://nvim/nvim
    - user: orlando
    - force: True
  cmd.run:
    # Helper to run packer sync to get plugins in right state and then quit
    - name: nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    # Help wakatime finds its api key
    - env:
      - WAKATIME_HOME: {{ pillar['xdg_config_home'] }}/wakatime
    - runas: orlando

vim-packer:
  git.cloned:
    - name: https://github.com/wbthomason/packer.nvim
    - target: {{ pillar['xdg_data_home'] }}/nvim/site/pack/packager/opt/packer.nvim
    - user: orlando

