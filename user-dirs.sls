include:
  - user

user-dirs:
  pkg.installed:
    - name: xdg-user-dirs

user-dirs-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/user-dirs.dirs
    - contents: |
        XDG_DESKTOP_DIR={{ pillar['xdg_desktop_dir'] }}
        XDG_DOCUMENTS_DIR={{ pillar['xdg_documents_dir'] }}
        XDG_DOWNLOAD_DIR={{ pillar['xdg_download_dir'] }}
        XDG_MUSIC_DIR={{ pillar['xdg_music_dir'] }}
        XDG_PICTURES_DIR={{ pillar['xdg_pictures_dir'] }}
        XDG_PUBLICSHARE_DIR={{ pillar['xdg_publicshare_dir'] }}
        XDG_TEMPLATES_DIR={{ pillar['xdg_templates_dir'] }}
        XDG_VIDEOS_DIR={{ pillar['xdg_videos_dir'] }}
    - user: {{ grains['user'] }}

user-dirs-folders:
  file.directory:
    - names:
      - {{ pillar['xdg_download_dir'] }}
      - {{ pillar['xdg_videos_dir'] }}
      - {{ pillar['xdg_pictures_dir'] }}
      - {{ pillar['xdg_pictures_dir'] }}/Wallpapers
      - {{ pillar['xdg_download_dir'] }}
      - {{ pillar['xdg_music_dir'] }}
      - {{ pillar['xdg_videos_dir'] }}
      - {{ pillar['xdg_publicshare_dir'] }}
      - {{ pillar['xdg_templates_dir'] }}
      # Some other useful folders to have
      - {{ pillar['xdg_config_home'] }}
      - {{ pillar['xdg_documents_dir'] }}
      - {{ pillar['xdg_documents_dir'] }}/Archive
      - {{ pillar['xdg_documents_dir'] }}/Notes
      - /home/{{ grains['user'] }}/.local/bin
    - user: {{ grains['user'] }}

