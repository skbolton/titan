base:
  '*':
    - xorg
    - xorg.monitors
    - display-manager
    - audio
    - arch.reflector
    - user-dirs
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
    - qmk
    - rofi
    - sxhkd
    - taskwarrior
    - terminfo
    - tmux
    - zk
    - zsh

  'trinity|titan':
    - match: pcre
    - display-drivers.amd
  
  'neo':
    - display-drivers.nvidia
