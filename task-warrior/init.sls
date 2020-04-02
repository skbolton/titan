task-configs:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.taskrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/task-warrior/taskrc
    - force: True

tasklib:
  pip.installed:
    - name: tasklib
