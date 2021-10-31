qmk: pkg.installed

keyboards-config:
  git.cloned:
    - name: https://github.com/skbolton/qmk_firmware
    - target: /home/orlando/Public/qmk_firmware
    - user: orlando

qmk-udev-rule:
  file.managed:
    - name: /etc/udev/rules.d/50-qmk.rules
    - source: salt://qmk/50-qmk.rules
    - user: orlando
  cmd.run:
    - name: udevadm control --reload-rules
    # Reload udev rules if the managed file changes
    - onchanges:
      - file: qmk-udev-rule
      

