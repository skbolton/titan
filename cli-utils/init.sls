ripgrep:
  pkg.installed

exa:
  pkg.installed

bpytop:
  pkg.installed

picom:
  cmd.run:
    - name: paru -S picom-jonaburg-git --skipreview --noconfirm
    - runas: orlando

skim:
  pkg.installed

  
  
