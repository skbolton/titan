include:
  - crons
  - python

task:
  pkg.installed

task-configs:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/task/taskrc
    - makedirs: True
    - source: salt://taskwarrior/taskrc
    - user: {{ grains['user'] }}
    - force: True

tasklib:
  pip.installed:
    - name: tasklib

timewarrior:
  pkg.installed:
    - name: timew

timewarrior-taskwarrior-hook:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/task/hooks/on-modify.timewarrior
    - source: salt://taskwarrior/on-modify.timewarrior
    - makedirs: True
    - mode: keep
    - user: {{ grains['user'] }}

task-sync-cron:
  cron.present:
    - identifier: "sync taskwarrior"
    - name: 'source $HOME/.zshenv && task sync'
    # every 10 minutes
    - minute: "*/10"
    - user: {{ grains['user'] }}
