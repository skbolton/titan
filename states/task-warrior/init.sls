task-configs:
  file.managed:
    - name: {{ grains.homedir }}/.taskrc
    - source: {{ grains.statesdir }}/task-warrior/taskrc
    - template: jinja

tasklib:
  pip.installed:
    - name: tasklib
