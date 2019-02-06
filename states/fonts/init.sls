fira-code-regular:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/FiraCode-Regular.ttf
    - source: {{ grains.statesdir }}/fonts/fira-code/FiraCode-Regular.ttf
    - user: {{ grains.user }}

fira-code-retina:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/FiraCode-Retina.ttf
    - source: {{ grains.statesdir }}/fonts/fira-code/FiraCode-Retina.ttf

roboto-mono-regular:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/RobotoMono-Regular.ttf
    - source: {{ grains.statesdir }}/fonts/roboto-mono/RobotoMono-Regular.ttf

roboto-mono-light:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/RobotoMono-Light.ttf
    - source: {{ grains.statesdir }}/fonts/roboto-mono/RobotoMono-Light.ttf

roboto-mono-thing:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/RobotoMono-Thin.ttf
    - source: {{ grains.statesdir }}/fonts/roboto-mono/RobotoMono-Thin.ttf

fura-code-nerd-regular:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/Fura Code Regular Nerd Font Complete.ttf
    - source: {{ grains.statesdir }}/fonts/fura-code-nerd/Fura Code Regular Nerd Font Complete.ttf

fura-code-nerd-light:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/Fura Code Light Nerd Font Complete.ttf
    - source: {{ grains.statesdir }}/fonts/fura-code-nerd/Fura Code Light Nerd Font Complete.ttf

fura-code-nerd-retina:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/Fura Code Retina Nerd Font Complete.ttf
    - source: {{ grains.statesdir }}/fonts/fura-code-nerd/Fura Code Retina Nerd Font Complete.ttf

source-code-pro-light:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/Source Code Pro Light.ttf
    - source: {{ grains.statesdir }}/fonts/source-code-pro/SourceCodePro-Light.ttf

source-code-pro-regular:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/Source Code Pro Regular.ttf
    - source: {{ grains.statesdir }}/fonts/source-code-pro/SourceCodePro-Regular.ttf

source-code-pro-bold:
  file.copy:
    - name: {{ grains.homedir }}/Library/Fonts/Source Code Pro Bold.ttf
    - source: {{ grains.statesdir }}/fonts/source-code-pro/SourceCodePro-Bold.ttf
