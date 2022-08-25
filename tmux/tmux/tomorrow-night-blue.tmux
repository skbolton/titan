set -g status-interval 3
set-option -g status-position bottom

# Status line
set -g status-style default
set -g status-right-length 80
set -g status-left-length 100
set -g window-status-separator "" 
set -g status-bg black

#Bars ---------------------------------
set -g status-left "#[fg=black,bg=green]  #S #[fg=green,bg=black]$LEFT_SEPARATOR"

set -g status-right "#[fg=black,bg=blue]$LEFT_SEPARATOR#[fg=black,bg=blue] %Y-%m-%d $LEFT_SUB_SEPARATOR %I:%M #[fg=green,bg=blue] $RIGHT_SEPARATOR#[bg=green,fg=black] #(whoami) "

# Windows ------------------------------
set -g status-justify left 
set -g window-status-format "#[fg=brightwhite] #I $LEFT_SUB_SEPARATOR #{?window_zoomed_flag, ,}#W "
set -g window-status-current-format "#[fg=black,bg=blue]$LEFT_SEPARATOR#[bg=blue,fg=black] #I $LEFT_SUB_SEPARATOR #{?window_zoomed_flag, ,}#[fg=black]#W #[fg=blue,bg=black]$LEFT_SEPARATOR"
