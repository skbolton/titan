include:
  - passwords

# Mail sync utility
mbsync:
  pkg.installed:
    - name: isync

mbsync-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/mbsync/.mbsyncrc
    - template: jinja
    - source: salt://mail/.mbsyncrc
    - makedirs: True
    - user: {{ grains['user'] }}

# MU is a mail indexer to make searching email quick and easy
mu: 
  cmd.run:
    - name: paru -S mu --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi mu

notmuch: pkg.installed

neomutt: pkg.installed

neomutt-config:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/neomutt
    - source: salt://mail/neomutt
    - user: {{ grains['user'] }}

maildirs:
  file.directory:
    - names:
      - {{ pillar['xdg_data_home'] }}/Mail/GB
      - {{ pillar['xdg_data_home'] }}/Mail/BOTM
    - user: {{ grains['user'] }}

