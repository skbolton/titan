cronie: pkg.installed

cron-daemon:
  service.running:
    - enable: True
    - name: cronie

pacman-download-updates:
  cron.present:
    - identifier: "download pacman updates without applying"
    - name: pacman -Syuw --noconfirm
    # every two hours
    - minute: 0
    - hour: "*/2"
