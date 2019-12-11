# There are some entries that are not in the highstate because they are kind of
# a pain in the ass and I don't want to accidentally call the high state and blow
# them away
# - habitica
base:
  '*':
    - git
    - zsh
    - node
    - nvim
    - tmux
    - kitty
    - task-warrior
    - ranger

  'os:MacOS':
    - match: grain
    - amethyst
    - mac-utils
