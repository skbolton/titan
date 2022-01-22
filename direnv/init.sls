direnv:
  cmd.run:
    - name: paru -S direnv --skipreview --noconfirm
    - runas: {{ grains['user'] }}
    - unless: paru -Qi direnv
