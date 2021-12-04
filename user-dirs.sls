include:
  - orlando

user-dirs:
  pkg.installed:
    - name: xdg-user-dirs

user-dirs-config:
  file.managed:
    - name: /home/orlando/.config/user-dirs.dirs
    - contents: |
        XDG_DESKTOP_DIR="$HOME/Desktop"
        XDG_DOCUMENTS_DIR="$HOME/Documents"
        XDG_DOWNLOAD_DIR="$HOME/Downloads"
        XDG_MUSIC_DIR="$HOME/Music"
        XDG_PICTURES_DIR="$HOME/Pictures"
        XDG_PUBLICSHARE_DIR="$HOME/Public"
        XDG_TEMPLATES_DIR="$HOME/Templates"
        XDG_VIDEOS_DIR="$HOME/Videos"
    - user: orlando

user-dirs-folders:
  file.directory:
    - names:
        - /home/orlando/Pictures
        - /home/orlando/Pictures/Wallpapers
        - /home/orlando/Downloads
        - /home/orlando/Music
        - /home/orlando/Videos
        - /home/orlando/Public
        - /home/orlando/Templates
        # Some other useful folders to have
        - /home/orlando/.config
        - /home/orlando/Documents/Archive
        - /home/orlando/Documents/Delta
        - /home/orlando/.local/bin
    - user: orlando

