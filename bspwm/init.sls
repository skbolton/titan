include:
  - sxhkd
  - cli-utils
  - dunst
  - polybar
  - rofi
  - picom
  - xorg

bspwm:
  pkg.installed

bspwm-config-directory:
  file.directory:
    - name: {{ pillar['xdg_config_home'] }}/bspwm
    - makedirs: True
    - user: {{ grains['user'] }}

bspwm-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/bspwm/bspwmrc
    - source: salt://bspwm/bspwmrc
    - user: {{ grains['user'] }}
    - mode: keep
    - force: True

bspwm-specific-sxhkd:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/bspwm/bspwm-sxhkdrc
    - source: salt://bspwm/bspwm-sxhkdrc
    - makedirs: True
    - user: {{ grains['user'] }}
    - force: True

betterlockscreen:
  cmd.run:
    - name: paru -S betterlockscreen --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi betterlockscreen
