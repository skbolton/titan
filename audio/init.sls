alsa:
  pkg.installed:
    - name: alsa-utils

pulseaudio:
  pkg.installed:
  - name: pulseaudio
  - require:
    - pkg: alsa

pavucontrol:
  pkg.installed:
    - require:
      - pkg: pulseaudio

pacmixer:
  pkg.installed:
    - name: pacmixer
    - require:
      - pkg: pulseaudio

bluetooth:
  pkg.installed:
    - pkgs:
      - bluez
      - bluez-utils
      - pulseaudio-bluetooth
    - require:
      - pkg: pulseaudio
