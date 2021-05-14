include:
  - crons

pacman-download-updates:
  cron.present:
    - identifier: "download pacman updates without applying"
    - name: pacman -Syuw --noconfirm
    # every two hours
    - minute: 0
    - hour: "*/2"
