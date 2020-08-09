task-configs:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.taskrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/task-warrior/taskrc
    - force: True

tasklib:
  pip.installed:
    - name: tasklib

# Sync the current years task to machine
taskdata:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.task
    - target: {{ salt["environ.get"]("HOME") }}/cloud/Tasks/current-year/
    - force: True
