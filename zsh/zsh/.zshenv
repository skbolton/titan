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
export NNN_BMS="a:$HOME/Documents/Archive;i:$IN;d:$NOTE/Journal;g:$HOME/Documents/Genesis-Block;D:$HOME/Documents;n:$NOTE;o:$HOME/Downloads;r:$NOTE/Resources;w:$HOME/Pictures/Wallpapers"
BLK="00" CHAR="00" DIR="69" EXE="DE" REG="00" HLI="00" SLI="00" MIS="00" ORP="00" FIF="00" SOC="00" UNK="00"
export NNN_FCOLORS="$BLK$CHAR$DIR$EXE$REG$HLI$SLI$MIS$ORP$FIF$SOC$UNK"
export NNN_COLORS="6666"
export NNN_PLUG="p:preview-tui"
export NNN_FIFO=/tmp/nnn.fifo

# Git helpers
# Fallback value when review base is not set
# This environment sets up what the "master" branch is for a repo
# in case a repo uses a non standard version
export REVIEW_BASE=master

export PATH
