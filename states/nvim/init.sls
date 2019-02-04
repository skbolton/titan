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

nvim-packages-installed:
  cmd.run:
    - name: nvim +PluginInstall +qall
