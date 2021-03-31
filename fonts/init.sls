remix-icon:
  file.symlink:
    - name: /home/orlando/.local/share/fonts/remixicon.ttf
    - target: /home/orlando/titan/fonts/remixicon.ttf
    - makedirs: True
    - user: orlando

roboto-mono:
  cmd.run:
    - name: paru -S nerd-fonts-roboto-mono --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi nerd-fonts-roboto-mono

source-sans-pro:
  file.symlink:
    - name: /home/orlando/.local/share/fonts/adobe
    - target: /home/orlando/titan/fonts/adobe
    - makedirs: True
    - user: orlando

iosevka:
  cmd.run:
    - name: paru -S ttf-iosevka --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi ttf-iosevka

stellar:
  file.symlink:
    - name: /home/orlando/.local/share/fonts/Stellar
    - target: /home/orlando/titan/fonts/Stellar
    - user: orlando

victor-mono:
  file.symlink:
    - name: /home/orlando/.local/share/fonts/VictorMonoNerdFont
    - target: /home/orlando/titan/fonts/VictorMono Nerd Font/
    - user: orlando

