{% from "xorg/map.jinja" import monitor_config with context %}

monitors:
  file.managed:
    - name: /etc/X11/xorg.conf.d/10-monitor.conf
    - source: salt://xorg/xorg.conf.d/{{monitor_config}}
