base:
  '*':
    - xorg
    - xorg.monitors
    - display-manager
    - audio
    - arch.reflector
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
    - display-drivers.amd
  
  'neo':
    - display-drivers.nvidia
