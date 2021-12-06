# ZSH Environment
# These are for variables that I want to adjust and be able to source a new shell and have pop up
# other more standard variables should go in .zprofile
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_DISABLE_COMPFIX=true
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000

# XDG Base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export BROWSER="firefox"
export MANPAGER="nvim +Man!"
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"

# GPG shenanigans
export GNUPGHOME="$XDG_CONFIG_HOME/gpg"
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_GPG_OPTS="--no-throw-keyids"
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

export SKIM_DEFAULT_COMMAND="rg --files --hidden -g !.git"
export SKIM_DEFAULT_OPTIONS="--reverse --ansi --color=fg:15,hl:03,hl+:03,matched_bg:-1,bg+:-1,fg+:-1,current_match_bg:-1,cursor:06,spinner:05,info:07,prompt:06"
export FZF_DEFAULT_OPTS="--reverse --ansi --color=fg:15,hl:3,hl+:3,bg+:-1,fg+:-1,pointer:06,spinner:05,info:7,prompt:6"

# Android config
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export _JAVA_AWT_WM_NONREPARENTING=1

export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/.asdfrc"
export ASDF_DIR="$XDG_DATA_HOME/asdf"
export ASDF_DATA_DIR=$ASDF_DIR

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"
export MIX_XDG=1
export HEX_HOME="$XDG_CACHE_HOME/hex"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Go
export GOPATH=$XDG_DATA_HOME/go
export GO111MODULE=on
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker" 
# ZOOM - What the hell is SSB?
export SSB_HOME="$XDG_DATA_HOME/zoom"


# nnn config
export NNN_OPTS="Hd"
export NNN_TRASH=1
export NNN_BMS="a:$HOME/Documents/Archive;g:$HOME/Documents/Genesis-Block;D:$HOME/Documents;d:$HOME/Documents/Delta;o:$HOME/Downloads;f:$HOME/Documents/Archive/Finances/$(date +%Y);w:$HOME/Pictures/Wallpapers"
BLK="00" CHAR="00" DIR="56" EXE="DE" REG="00" HLI="00" SLI="00" MIS="00" ORP="00" FIF="00" SOC="00" UNK="00"
export NNN_FCOLORS="$BLK$CHAR$DIR$EXE$REG$HLI$SLI$MIS$ORP$FIF$SOC$UNK"
export NNN_COLORS="5555"
export NNN_PLUG="p:preview-tui"
export NNN_FIFO=/tmp/nnn.fifo

# ZK
export ZK_NOTEBOOK_DIR="$HOME/Documents/Delta"

export PATH="$GOPATH/bin:"$HOME"/.local/bin:"$XDG_DATA_HOME"/cargo/bin:"$HOME"/.local/share/gem/ruby/3.0.0/bin:$PATH"

# Git helpers
# Fallback value when review base is not set
# This environment sets up what the "master" branch is for a repo
# in case a repo uses a non standard version
export REVIEW_BASE=master
