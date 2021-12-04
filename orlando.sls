include:
  - zsh

orlando:
  user.present:
    - fullname: Orlando Collins
    - shell: /bin/zsh

avatar:
  file.managed:
    - name: /home/orlando/.face
    - source: salt://avatar.png
    - mode: 644

