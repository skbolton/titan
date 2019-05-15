#!/bin/bash

set -eu
set -o pipefail

user=$(whoami)
homedir=$HOME
statesdir=$(pwd)/states

# other variables here

# if on mac and brew is not around install it
if [[ `uname` == 'Darwin' ]];
then
  command -v brew > /dev/null 2>&1
  if [ $? -ne 0 ];
  then
    echo "Homebrew not found installing..."
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Now check for salt stack command
  if ! [ "$(command -v salt-call)" ]; then
    echo "SaltStack not found installing..."
    brew install saltstack

    # Change ownership of files that salt needs
    # This lets us avoid a sudo mess later on
    sudo chown -R "${user}" /var/log/salt /var/cache/salt

  fi
fi

# Setup grains if they don't exist
# grains are basically global variables that states can reference
if ! [ -f grains ];
then
  salt-call --local --config=./ grains.setvals "{ \
    \"user\": \"${user}\", \
    \"homedir\": \"${homedir}\", \
    \"statesdir\": \"${statesdir}\"
  }"
fi

# Either apply high states or a single state based on args passsed int
# Ex (running only tmux setup):
# $ ./bin/run.sh tmux
# Ex (running all states):
# $ ./bin/run.sh
if [[ "$#" -eq 1 ]];
then
  echo "applying $1 state"
	salt-call --local --config=./ --state-output=mixed --retcode-passthrough state.sls $1
else
  echo "applying high state"
	salt-call --local --config=./ --state-output=mixed --retcode-passthrough state.highstate
fi

