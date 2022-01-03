include:
  - crons
  - python

task:
  pkg.installed

task-configs:
  file.directory:
    - name: {{ pillar['xdg_config_home'] }}/task
    - user: orlando
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/task/taskrc
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
