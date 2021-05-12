task:
  pkg.installed

task-configs:
  file.managed:
    - name: /home/orlando/.taskrc
    - source: salt://task-warrior/taskrc
    - user: orlando
    - force: True

tasklib:
  pip.installed:
    - name: tasklib
