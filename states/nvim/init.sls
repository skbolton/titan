vundle:
  git.cloned:
    - name: https://github.com/VundleVim/Vundle.vim.git
    - target: {{ grains.homedir }}/.vundle/bundle/Vundle.vim

nvim:
  pkg.installed:
    - name: neovim

nvim-config:
  file.symlink:
    - name: {{ grains.homedir }}/.config/nvim
    - target: {{ grains.statesdir }}/nvim/nvim

minpac:
  git.cloned:
    - name: https://github.com/k-takata/minpac.git
    - target: {{ grains.homedir }}/.local/share/nvim/site/pack/minpac/opt/minpac

coc-settings:
  file.managed:
    - name: {{grains.homedir}}/.config/nvim/coc-settings.json
    - source: {{ grains.statesdir }}/nvim/coc-settings.json
    - template: jinja

