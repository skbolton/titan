{% from "xorg/map.jinja" import monitor_config with context %}

monitors:
  file.symlink:
    - name: /etc/X11/xorg.conf.d/10-monitor.conf
    - target: /home/orlando/titan/xorg/xorg.conf.d/{{monitor_config}}
