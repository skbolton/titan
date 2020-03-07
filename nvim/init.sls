vundle:
  git.cloned:
    - name: https://github.com/VundleVim/Vundle.vim.git
    - target: {{ salt["environ.get"]("HOME") }}/.vundle/bundle/Vundle.vim

nvim:
  pkg.installed:
    - name: neovim

nvim-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/nvim
    - target: {{ salt["environ.get"]("HOME") }}/titan/nvim/nvim

minpac:
  git.cloned:
    - name: https://github.com/k-takata/minpac.git
    - target: {{ salt["environ.get"]("HOME") }}/.local/share/nvim/site/pack/minpac/opt/minpac

coc-settings:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/nvim/coc-settings.json
    - target: {{ salt["environ.get"]("HOME") }}/titan/nvim/coc-settings.json

