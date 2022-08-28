# vim: set ft=tmux:

#######################################################################
# General
#######################################################################
bind ! kill-server
bind -n S-Up set-option status
bind -n S-Down set-option status
bind Escape copy-mode
bind-key p paste-buffer
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi V send-keys -X select-line
bind-key -T copy-mode-vi y send-keys -X copy-selection
bind-key -T copy-mode-vi C-y send-keys -X rectangle-toggle
bind-key -T copy-mode-vi Escape send-keys -X cancel
bind-key C-r choose-buffer

#######################################################################
# Panes
#######################################################################
bind | split-window -h
bind - split-window -v
bind H resize-pane -L 5
bind J resize-pane -D 5
bind K resize-pane -U 5
bind L resize-pane -R 5

#######################################################################
# Windows
#######################################################################
bind -n S-Left previous-window
bind -n S-Right next-window
bind h previous-window
bind l next-window

#######################################################################
# Clients
#######################################################################
bind j switch-client -p
bind k switch-client -n
bind Tab switch-client -l
bind C-d switch-client -t Delta
bind C-h new-window -n  dijo

#######################################################################
# Tasks
#######################################################################
bind s display-popup -E -w 80% -h 70% rally.sh
bind S display-popup -E 'tmux switch-client -t "$(tmux list-sessions -F "#{session_name}"| sk)"'

#######################################################################
# Layers
#######################################################################
bind g switch-client -Ttable1
bind -Ttable1 x split-window -h -l 100 \; send-keys 'gh pr checks' C-m
bind -Ttable1 ? split-window -h -l 100 \; send-keys 'gh' C-m
bind -Ttable1 ! split-window -h -l 100 'gh pr view --web'
bind -Ttable1 t split-window -h 'clickup.sh'
