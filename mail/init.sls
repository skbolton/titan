include:
  - passwords

# Mail sync utility
mbsync:
  pkg.installed:
    - name: isync

mbsync-config:
  file.managed:
    - name: /home/orlando/.config/mbsync/.mbsyncrc
    - template: jinja
    - source: salt://mail/.mbsyncrc
    - makedirs: True
    - user: orlando

# MU is a mail indexer to make searching email quick and easy
mu: pkg.installed



