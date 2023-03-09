export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ZSH Config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_DISABLE_COMPFIX=true
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export SAVEHIST=1000000000


# System utilities
export EDITOR="nvim"
export BROWSER="firefox"
export MANPAGER="nvim +Man!"
export PAGER=bat
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"

path+=($HOME/.local/bin)

# Android config
export ANDROID_HOME=/opt/android-sdk
path+=($ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools)
export _JAVA_AWT_WM_NONREPARENTING=1

export ASDF_DIR=/opt/asdf-vm/
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/.asdfrc"
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"
export MIX_XDG=1
export HEX_HOME="$XDG_CACHE_HOME/hex"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
path+=($CARGO_HOME/bin)

# Go
export GOPATH=$XDG_DATA_HOME/go
path+=($GOPATH/bin)
export GO111MODULE=on
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker" 
# ZOOM - What the hell is SSB?
export SSB_HOME="$XDG_DATA_HOME/zoom"

# Ruby
path+=($XDG_DATA_HOME/gem/ruby/3.0.0/bin)

# nnn config
export NNN_OPTS="Hd"
export NNN_TRASH=1
DOC="$HOME/Documents" NOTE="$DOC/Notes" IN="$NOTE/Inbox"
export NNN_BMS="a:$HOME/Documents/Archive;i:$IN;d:$DOC/Delta;h:$NOTE/Hightop;D:$HOME/Documents;n:$NOTE;o:$HOME/Downloads;c:$NOTE/Cortex;w:$HOME/Pictures/Wallpapers"
BLK="00" CHAR="00" DIR="69" EXE="DE" REG="00" HLI="00" SLI="00" MIS="00" ORP="00" FIF="00" SOC="00" UNK="00"
export NNN_FCOLORS="$BLK$CHAR$DIR$EXE$REG$HLI$SLI$MIS$ORP$FIF$SOC$UNK"
export NNN_COLORS="6666"
export NNN_PLUG="p:preview-tui"
export NNN_FIFO=/tmp/nnn.fifo

# Git helpers
# Fallback value when review base is not set
# This environment sets up what the "master" branch is for a repo
# in case a repo uses a non standard version
export REVIEW_BASE=main

# Delta Config
export ZK_NOTEBOOK_DIR="$HOME/Documents/Notes"
export REM_FILE="$HOME/Documents/Delta/Dashboards/remind.rem"
export TIMEWARRIORDB="$HOME/Documents/Delta/Dashboards/trackers/timesheets"
export HARSHPATH="$HOME/Documents/Delta/Dashboards/trackers/harsh"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_GPG_OPTS="--no-throw-keyids"
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

export SKIM_DEFAULT_COMMAND="rg --files --hidden -g !.git"
export SKIM_DEFAULT_OPTIONS="--reverse --ansi --color=fg:15,hl:03,hl+:03,matched_bg:-1,bg+:-1,fg+:-1,current_match_bg:-1,cursor:06,spinner:05,info:07,prompt:06"
export FZF_DEFAULT_OPTS="--reverse --ansi --color=bg+:-1,fg:15,fg+:-1,prompt:6,header:5,pointer:2,hl:3,hl+:3,spinner:05,info:15,border:15"

export PATH
