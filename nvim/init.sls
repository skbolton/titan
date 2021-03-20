nvim:
  pkg.installed:
    - name: neovim

nvim-config:
  file.symlink:
    - name: /home/orlando/.config/nvim
    - target: /home/orlando/titan/nvim/nvim
    - user: orlando

vim-packager:
  git.cloned:
    - name: https://github.com/kristijanhusak/vim-packager
    - target: /home/orlando/.config/nvim/pack/packager/opt/vim-packager
    - user: orlando

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

