python: 
  pkg.installed

pip:
  pkg.installed:
    - name: python-pip
    - require:
      - pkg: python

