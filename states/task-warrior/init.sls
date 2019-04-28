task-configs:
  file.symlink:
    - name: {{ grains.homedir }}/.taskrc
    - target: {{ grains.statesdir }}/task-warrior/taskrc
