include:
  - zsh

{{ grains['user'] }} present:
  user.present:
    - name: {{ grains['user'] }}
    - fullname: {{ grains['user_fullname'] }}
    - shell: /bin/zsh

avatar:
  file.managed:
    - name: /home/{{ grains['user'] }}/.face
    - source: salt://avatar.png
    - mode: 644

