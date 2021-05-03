base:
  '*':
    - audio
    - asdf
    - bspwm
    - cli-utils
    - direnv
    - dunst
    - display-manager
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
    - xorg
    - zk
    - zsh

  'trinity|titan':
    - match: pcre
    - xorg.monitors
