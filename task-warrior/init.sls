task-configs:
  file.managed:
    - name: {{ salt["environ.get"]("HOME") }}/.taskrc
    - source: {{ salt["environ.get"]("HOME") }}/titan/task-warrior/taskrc
    - template: jinja

tasklib:
  pip.installed:
    - name: tasklib
