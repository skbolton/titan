remix-icon:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/fonts/remixicon.ttf
    - source: salt://fonts/remixicon.ttf
    - makedirs: True
    - user: {{ grains['user'] }}

roboto-mono:
  cmd.run:
    - name: paru -S nerd-fonts-roboto-mono --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi nerd-fonts-roboto-mono

roboto-slab:
  cmd.run:
    - name: paru -S ttf-roboto-slab --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi ttf-roboto-slab

fira-code:
  cmd.run:
    - name: paru -S ttf-fira-code --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi ttf-fira-code

source-sans-pro:
  file.recurse:
    - name: {{ pillar['xdg_data_home'] }}/fonts/adobe
    - source: salt://fonts/adobe
    - makedirs: True
    - user: {{ grains['user'] }}

iosevka:
  cmd.run:
    - name: paru -S ttf-iosevka --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi ttf-iosevka

iosevka-ss18:
  cmd.run:
    - name: paru -S ttf-iosevka-ss18 --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi ttf-iosevka-ss18

stellar:
  file.recurse:
    - name: {{ pillar['xdg_data_home'] }}/fonts/Stellar
    - source: salt://fonts/Stellar
    - user: {{ grains['user'] }}

victor-mono:
  file.recurse:
    - name: {{ pillar['xdg_data_home'] }}/fonts/VictorMonoNerdFont
    - source: salt://fonts/VictorMono Nerd Font/
    - user: {{ grains['user'] }}

ligalex-mono:
  file.recurse:
    - name: {{ pillar['xdg_data_home'] }}/fonts/Ligalex
    - source: salt://fonts/Ligalex
    - user: {{ grains['user'] }}

