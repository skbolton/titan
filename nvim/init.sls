nvim:
  pkg.installed:
    - name: neovim

nvim-config:
  file.symlink:
    - name: /home/orlando/.config/nvim
    - target: /home/orlando/titan/nvim/nvim
    - user: orlando
    - force: True

vim-packer:
  git.cloned:
    - name: https://github.com/wbthomason/packer.nvim
    - target: /home/orlando/.local/share/nvim/site/pack/packager/opt/packer.nvim
    - user: orlando

coc-settings:
  file.symlink:
    - name: /home/orlando/.config/nvim/coc-settings.json
    - target: /home/orlando/titan/nvim/coc-settings.json
    - user: orlando

