base:
  '*':
    - xorg
    - xorg.monitors
    - display-manager
    - audio
    - user-dirs
    - networking
    - scanner
    - systemd
    - asdf
    - awesome
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
    - pam
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

  'os:Arch':
    - match: grain
    - arch
