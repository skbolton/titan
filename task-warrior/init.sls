task-configs:
  file.symlink:
    - name: /home/orlando/.taskrc
    - target: /home/orlando/titan/task-warrior/taskrc
    - user: orlando
    - force: True

tasklib:
  pip.installed:
    - name: tasklib
