cronie: pkg.installed

cron-daemon:
  service.running:
    - enable: True
    - name: cronie

pacman-download-updates:
  cron.present:
    - identifier: "download pacman updates without applying"
    - name: pacman -Syuw --noconfirm
    - minute: 0
    - hour: 11
