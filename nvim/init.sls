nvim:
  pkg.installed:
    - name: neovim

nvim-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/nvim
    - target: {{ salt["environ.get"]("HOME") }}/titan/nvim/nvim

vim-packager:
  git.cloned:
    - name: https://github.com/kristijanhusak/vim-packager
    - target: {{ salt["environ.get"]("HOME") }}/.config/nvim/pack/packager/opt/vim-packager

coc-settings:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/nvim/coc-settings.json
    - target: {{ salt["environ.get"]("HOME") }}/titan/nvim/coc-settings.json

