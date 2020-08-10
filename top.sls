# There are some entries that are not in the highstate because they are kind of
# a pain in the ass and I don't want to accidentally call the high state and blow
# them away
# - habitica
base:
  '*':
    - git
    - zsh
    - node
    - ruby
    - nvim
    - tmux
    - kitty
    - task-warrior
    - ranger
    - direnv
    - starship
    - terminfo
    - rust

  'os:MacOS':
    - match: grain
    - amethyst
    - mac-utils
    - mac-programs

  'os:Manjaro':
    - match: grain
    - bspwm
    - rofi
    - polybar
    - dunst
