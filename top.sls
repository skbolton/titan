base:
  '*':
    - xorg
    - display-manager
    - audio
    - asdf
    - bspwm
    - cli-utils
    - direnv
    - dunst
    - fonts
    - git
    - gpg
    - habits
    - kitty
    - nnn
    - nvim
    - picom
    - polybar
    - python
    - rofi
    - sxhkd
    - task-warrior
    - terminfo
    - tmux
    - zk
    - zsh

  'trinity|titan':
    - match: pcre
    - xorg.monitors
