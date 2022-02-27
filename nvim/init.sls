include:
  - lang.python
  - zk
  - finances
  - tmux
  - taskwarrior

# nvim:
#   pkg.installed:
#     - name: neovim

nvim:
  cmd.run:
    - name: paru -S neovim-git --noconfirm --skipreview --useask
    - unless: paru -Qi neovim-git
    - runas: {{ grains['user'] }}

nvim-python:
  pip.installed: 
    - name: pynvim

vim-packer:
  git.cloned:
    - name: https://github.com/wbthomason/packer.nvim
    - target: {{ pillar['xdg_data_home'] }}/nvim/site/pack/packager/opt/packer.nvim
    - user: {{ grains['user'] }}

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
    # Helper to run packer sync to get plugins in right state and then quit
    - name: nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    # Help wakatime finds its api key
    - runas: {{ grains['user'] }}
    - shell: /bin/zsh

