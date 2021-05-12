cronie: pkg.installed

cron-daemon:
  service.running:
    - enable: True
    - name: cronie

pacman-download-updates:
  cron.present:
    - name: pacman -Suw
    - minute: 0
    - hour: 11
