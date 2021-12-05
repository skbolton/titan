include:
  - zk
  - finances

nvim:
  pkg.installed:
    - name: neovim

old-configs-gone:
  file.absent:
    - name: /home/orlando/.config/nvim

nvim-config:
  file.recurse:
    - name: /home/orlando/.config/nvim
    - source: salt://nvim/nvim
    - user: orlando
    - force: True
  cmd.run:
    # Helper to run packer sync to get plugins in right state and then quit
    - name: nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    # Help wakatime finds its api key
    - env:
      - WAKATIME_HOME: /home/orlando/.config/wakatime
    - runas: orlando

vim-packer:
  git.cloned:
    - name: https://github.com/wbthomason/packer.nvim
    - target: /home/orlando/.local/share/nvim/site/pack/packager/opt/packer.nvim
    - user: orlando

