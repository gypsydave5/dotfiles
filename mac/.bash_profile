[[ -s ~/.bashrc ]] && source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export TESTING_MAKERS=working

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
