cronie: pkg.installed

cron-daemon:
  service.running:
    - enable: True
    - name: cronie
