include:
  - lang.python
  - zk
  - finances
  - tmux
  - taskwarrior

nvim-installed:
  cmd.run:
    - name: paru -R neovim-nightly-bin --noconfirm
    - runas: {{ grains['user'] }}
    - onlyif: 
      - paru -Qi neovim-nightly-bin
  pkg.installed:
    - name: neovim

# neovim-nightly-bin:
#   pkg.uninstalled:
#     - name: neovim
#   cmd.run:
#     - name: paru -S neovim-nightly-bin --noconfirm --skipreview
#     - runas: {{ grains['user'] }}
#     - unless: paru -Qi neovim-nightly-bin

nvim-python:
  pip.installed: 
    - name: pynvim

vim-packer-missing:
  file.absent:
    - name: {{ pillar['xdg_data_home'] }}/nvim/site/pack/packager/opt/packer.nvim

old-configs-gone:
  file.absent:
    - name: {{ pillar['xdg_config_home'] }}/nvim

nvim-config:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/nvim
    - source: salt://nvim/nvim
    - user: {{ grains['user'] }}
    - force: True
  cmd.run:
    # Helper to run Lazy sync to get plugins in right state and then quit
    - name: nvim --headless -c 'autocmd User LazySync quitall' -c 'Lazy sync'
    - runas: {{ grains['user'] }}

