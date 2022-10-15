include:
  - lang.python

task:
  pkg.installed

{% set task_home = pillar['xdg_config_home'] + '/task' %}

task-configs:
  file.managed:
    - name: {{ task_home }}/taskrc
    - makedirs: True
    - source: salt://taskwarrior/taskrc
    - user: {{ grains['user'] }}
    - template: jinja
    - force: True

taskserver-root-cert-file:
  file.managed:
    - name: {{ task_home }}/root-cert.pem
    - contents_pillar: taskwarrior:taskd_root_cert
    - user: {{ grains['user'] }}

taskserver-cert-file:
  file.managed:
    - name: {{ task_home }}/cert.pem
    - contents_pillar: taskwarrior:taskd_cert
    - user: {{ grains['user'] }}

taskserver-key-file:
  file.managed:
    - name: {{ task_home }}/key.pem
    - contents_pillar: taskwarrior:taskd_key
    - user: {{ grains['user'] }}

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

task-sync-service:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/systemd/user/task-sync.service
    - source: salt://taskwarrior/task-sync.service
    - makedirs: True
    - user: {{ grains['user'] }}

task-sync-timer:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/systemd/user/task-sync.timer
    - source: salt://taskwarrior/task-sync.timer
    - makedirs: True
    - user: {{ grains['user'] }}

task-sync-cron:
  cron.absent:
    - identifier: "sync taskwarrior"
    - name: 'source $HOME/.zshenv && task sync'
    # every 10 minutes
    - minute: "*/10"
    - user: {{ grains['user'] }}
