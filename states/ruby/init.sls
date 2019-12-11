# we need asdf installed
include:
  - asdf

# IMPORTANT: Asdf is a sourced function
# Since we might be in a shell that hasn't yet sourced it we need to source it before any calls to asdf

{% if grains['os'] == 'MacOS' %}
ruby-dependencies:
  cmd.run:
    - name: brew install openssl libyaml libffi
{% endif %}

asdf-ruby:
  cmd.run:
    - names: 
      # We have to source the script first since we might be running in a zsh session
      # that doesn't have it source in the rc
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf install ruby 2.6.4"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf global ruby 2.6.4"
    - unless: /bin/zsh -c "source ~/.asdf/asdf.sh; asdf current ruby"

