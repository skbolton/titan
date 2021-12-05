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
    - user: orlando

# MU is a mail indexer to make searching email quick and easy
mu: 
  cmd.run:
    - name: paru -S mu --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi mu

maildirs:
  file.directory:
    - names:
      - {{ pillar['xdg_data_home'] }}/Mail/GB
      - {{ pillar['xdg_data_home'] }}/Mail/BOTM
    - user: orlando

