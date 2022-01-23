go: pkg.installed

go-dir:
  file.directory:
    - name: {{ pillar['go_path'] }}
