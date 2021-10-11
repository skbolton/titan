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
    - emacs
    - fonts
    - git
    - gpg
    - kitty
    - mail
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
