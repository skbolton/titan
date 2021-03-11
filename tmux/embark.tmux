set -g status-interval 3
set-option -g status-position bottom

# Status line
set -g status-style default
set -g status-right-length 80
set -g status-left-length 100
set -g window-status-separator "" 
set -g status-bg black

#Bars ---------------------------------
set -g status-left "#[fg=green]#S"

set -g status-right "#[fg=brightwhite]%Y-%m-%d ∙ %I:%M"

# Windows ------------------------------
set -g status-justify left
set -g window-status-format "#[fg=brightwhite] #I #{?window_zoomed_flag, ,}#W"
set -g window-status-current-format "#[fg=yellow] #I #{?window_zoomed_flag, ,}#W"
