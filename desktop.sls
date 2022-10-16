include:
  - flatpak

nitrogen:
  pkg.installed

lxappearance:
  pkg.installed

nautilus:
  pkg.installed

firefox:
  pkg.installed

synology-drive:
  cmd.run:
    - name: flatpak install -y flathub com.synology.SynologyDrive

flameshot:
  pkg.installed

btop:
  pkg.installed

catppuccin-gtk:
  cmd.run:
    - name: paru -S --noconfirm --skipreview catppuccin-gtk-theme-mocha catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte
    - runas: {{ grains['user'] }}
    - unless: paru -Qi catppuccin-gtk-theme-latte

tela-circle-icon-theme:
  cmd.run:
    - name: paru -S tela-circle-icon-theme-git --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi tela-circle-icon-theme-git
