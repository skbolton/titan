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
mu: 
  cmd.run:
    - name: paru -S mu --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi mu

maildir:
  file.directory:
    - name: /home/orlando/.local/share/Mail
    - user: orlando

