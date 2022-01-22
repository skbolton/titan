{% from "display-drivers/map.jinja" import display_drivers with context %}

display-drivers-installed:
  pkg.installed:
    - names: {{ display_drivers }}


