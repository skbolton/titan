base:
  '*':
    - xorg
    - xorg.monitors
    - display-manager
    - audio
    - arch
    - user-dirs
    - asdf
    - bspwm
    - cli-utils
    - direnv
    - dunst
    - fonts
    - git
    - gpg
    - kitty
    - nnn
    - nvim
    - passwords
    - picom
    - polybar
    - python
    - qmk
    - rofi
    - sxhkd
    - taskwarrior
    - tmux
    - zk
    - zsh

  'trinity|prodigy':
    - match: pcre
    - display-drivers.amd
  
  'neo':
    - display-drivers.nvidia
