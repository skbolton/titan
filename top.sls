# There are some entries that are not in the highstate because they are kind of
# a pain in the ass and I don't want to accidentally call the high state and blow
# them away
# - habitica
base:
  '*':
    - asdf
    - bspwm
    - cli-utils
    - direnv
    - dunst
    - elixir
    - fonts
    - git
    - habits
    - kitty
    - nnn
    - node
    - nvim
    - picom
    - polybar
    - python
    - rofi
    - ruby
    - rust
    - sxhkd
    - task-warrior
    - terminfo
    - tmux
    - zsh
