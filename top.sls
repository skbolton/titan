base:
  '*':
    - xorg
    - xorg.monitors
    - display-manager
    - audio
    - arch
    - user-dirs
    - networking
    - scanner
    - systemd
    - asdf
    - bspwm
    - cli-utils
    - cloud
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
