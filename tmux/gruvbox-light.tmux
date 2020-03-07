set -g status-interval 3
set-option -g status-position bottom

# Status line
set -g status-style default
set -g status-right-length 80
set -g status-left-length 100
set -g window-status-separator "" 
set -g status-bg black

#Bars ---------------------------------
set -g status-left "#[fg=black,bg=blue]  #S #[fg=blue,bg=black]$LEFT_SEPARATOR"
set -g status-right "#[fg=black,bg=cyan]$LEFT_SEPARATOR#[fg=black,bg=cyan] %Y-%m-%d $LEFT_SUB_SEPARATOR %I:%M #[fg=blue,bg=cyan]$RIGHT_SEPARATOR#[bg=blue,fg=black] #(whoami) "

# Windows ------------------------------
set -g status-justify left 
set -g window-status-format "#[fg=white] #I $LEFT_SUB_SEPARATOR #W "
set -g window-status-current-format "#[fg=black,bg=cyan]$LEFT_SEPARATOR#[bg=cyan,fg=black] #I $LEFT_SUB_SEPARATOR #{?window_zoomed_flag,#[fg=cyan] ,}#[fg=black]#W #[fg=cyan,bg=black]$LEFT_SEPARATOR"
