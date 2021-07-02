include:
  - zk

nvim:
  pkg.installed:
    - name: neovim

nvim-config:
  file.recurse:
    - name: /home/orlando/.config/nvim
    - source: salt://nvim/nvim
    - user: orlando
    - force: True

vim-packer:
  git.cloned:
    - name: https://github.com/wbthomason/packer.nvim
    - target: /home/orlando/.local/share/nvim/site/pack/packager/opt/packer.nvim
    - user: orlando

