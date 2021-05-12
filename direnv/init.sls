direnv:
  cmd.run:
    - name: paru -S direnv --skipreview --noconfirm
    - runas: orlando
    - unless: paru -Qi direnv
