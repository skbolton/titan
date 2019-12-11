import os


def user_state():
    grains = {}
    # Some code for logic that sets grains like
    grains['user'] = os.getenv('USER')
    grains['homedir'] = os.path.expandvars('$HOME')
    grains['statesdir'] = os.path.expandvars('$HOME/titan/')
    return grains
