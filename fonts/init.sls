remix-icon:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/fonts/remixicon.ttf
    - source: salt://fonts/remixicon.ttf
    - makedirs: True
    - user: {{ grains['user'] }}

roboto-mono:
  file.recurse:
    - name: {{ pillar['xdg_data_home'] }}/fonts/LigaRobotoMono
    - source: salt://fonts/LigaRobotoMono
    - makedirs: True
    - user: {{ grains['user'] }}

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

operator-mono-italic:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/fonts/OperatorMonoLig-BookItalic.otf
    - contents_pillar: operator-mono:lig-book-italic
    - user: {{ grains['user'] }}

operator-mono-bold:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/fonts/OperatorMono-Bold.otf
    - contents_pillar: operator-mono:bold
    - user: {{ grains['user'] }}

operator-mono-lig-book:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/fonts/OperatorMonoLig-Book.otf
    - contents_pillar: operator-mono:lig-book 
    - user: {{ grains['user'] }}
