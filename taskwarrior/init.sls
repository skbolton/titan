include:
  - crons
  - python

task:
  pkg.installed

task-configs:
  file.managed:
    - name: /home/orlando/.config/task/taskrc
    - source: salt://taskwarrior/taskrc
    - user: orlando
    - force: True

tasklib:
  pip.installed:
    - name: tasklib

task-sync-cron:
  cron.present:
    - identifier: "sync taskwarrior"
    - name: task sync
    # every 10 minutes
    - minute: "*/10"
    - user: orlando
