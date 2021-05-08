{# nvim:
  pkg.installed:
    - name: neovim #}
nvim:
  cmd.run:
    - runas: orlando
    - name: paru -S neovim-nightly-git --noconfirm --skipreview
    - unless: paru -Qi neovim-nightly-git

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

