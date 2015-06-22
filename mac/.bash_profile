#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

<<<<<<< HEAD
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export TESTING_MAKERS=working

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(direnv hook bash)"

# bash vi mode
set -o vi

# autojump path
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

# homebrew autocomplete
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Docker set-up
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
