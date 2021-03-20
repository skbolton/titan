task-configs:
  file.symlink:
    - name: /home/orlando/.taskrc
    - target: /home/orlando/titan/task-warrior/taskrc
    - user: orlando
    - force: True

tasklib:
  pip.installed:
    - name: tasklib

# Sync the current years task to machine
taskdata:
  file.symlink:
    - name: /home/orlando/.task
    - target: /home/orlando/Documents/sync/Tasks/current-year/
    - user: orlando
    - force: True
