base:
  '*':
    - display-drivers
    - xorg
    - xorg.monitors
    - display-manager
    - audio
    - bluetooth
    - user-dirs
    - networking
    - scanner
    - asdf
    - awesome
    - bspwm
    - calendar
    - cli-utils
    - cloud
    - direnv
    - desktop
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
    - qmk
    - rofi
    - sxhkd
    - taskwarrior
    - tmux
    - zk
    - zsh

  'os:Arch':
    - match: grain
    - arch

  'init:systemd':
    - match: grain
    - systemd
