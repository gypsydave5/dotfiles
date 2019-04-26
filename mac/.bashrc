# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything

#GNU utils
## adds the gnu versions of the utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/share/man:$MANPATH"
MANPATH="/usr/local/opt/gnu-tar/share/man:$MANPATH"
MANPATH="/usr/local/opt/findutils/share/man:$MANPATH"

### some environment variables ###
export TERM=xterm-256color
export EDITOR=vi

case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

export PATH="$PATH:/usr/local/sbin" # rabbit-mq path

### Sets the Mail Environment Variable
export MAIL=/var/spool/mail/davidwic

#nvm directory
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

eval "$(direnv hook bash)"

# autojump path
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

# homebrew autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin # My own special bins

# AWS CLI Autocomplete
complete -C aws_completer aws

# emacs daemon
export ALTERNATE_EDITOR=""

# prompt
source $HOME/.bash_plugins/prompt.sh

# C Libraries
export LD_LIBRARY_PATH=~/lib:$LD_LIBRARY_PATH

# Browser
export BROWSER=firefox

# Docker
source $HOME/.bash_plugins/docker.sh

# ls colors
source $HOME/.bash_plugins/ls_colors.sh

## Python
# only use pip in a virtual env
export PIP_REQUIRE_VIRTUALENV=false

# Ruby
export RUBIES=$HOME/.rubies
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby

#default email address
export EMAIL=david.wickes@springernature.com

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#dot
export GRAPHVIZ_DOT=/usr/local/opt/graphviz/bin/dot

#haskell - stack local directory
export PATH="$HOME/.local/bin:$PATH"

#Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib"

# Perl shizzle
PATH="/Users/davidwic/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/davidwic/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/davidwic/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/davidwic/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/davidwic/perl5"; export PERL_MM_OPT;

export PATH=$PATH:/Library/TeX/texbin

#Clojure Boot
export BOOT_JVM_OPTIONS="-client
-XX:+TieredCompilation
-XX:TieredStopAtLevel=1
-Xmx2g
-XX:+UseConcMarkSweepGC
-XX:+CMSClassUnloadingEnabled
-Xverify:none"

#Jenv
export JENV_ROOT=/usr/local/opt/jenv
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#NodeJS
nvm use node

# QOTD
if type fortune > /dev/null; then
  printf "\n$(fortune)\n"
fi

HISTIGNORE='fg'

alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" > '~/.emacs.d/eshell/alias'
PATH=/usr/local/opt/gnu-tar/libexec/gnubin:/Users/dwo3984/perl5/perlbrew/bin:/usr/local/opt/ncurses/bin:/usr/local/opt/jenv/shims:/Users/dwo3984/.jenv/bin:/Users/davidwic/perl5/bin:/Users/dwo3984/.cargo/bin:/Users/dwo3984/.local/bin:/Users/dwo3984/.gem/ruby/2.5.1/bin:/Users/dwo3984/.rubies/ruby-2.5.1/lib/ruby/gems/2.5.0/bin:/Users/dwo3984/.rubies/ruby-2.5.1/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/ncurses/bin:/usr/local/opt/jenv/shims:/Users/dwo3984/.jenv/bin:/Users/davidwic/perl5/bin:/Users/dwo3984/.cargo/bin:/Users/dwo3984/.local/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin:/usr/local/opt/ncurses/bin:/usr/local/opt/jenv/shims:/Users/dwo3984/.jenv/bin:/Users/davidwic/perl5/bin:/Users/dwo3984/.cargo/bin:/Users/dwo3984/.local/bin:/Users/dwo3984/.nvm/versions/node/v10.9.0/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/Users/dwo3984/go/bin:/Users/dwo3984/bin:/usr/local/sbin:/Users/dwo3984/go/bin:/Users/dwo3984/bin:/Library/TeX/texbin:/usr/local/sbin:/Users/dwo3984/go/bin:/Users/dwo3984/bin:/Library/TeX/texbin
MANPATH=/usr/local/opt/gnu-tar/libexec/gnuman:/usr/local/opt/findutils/share/man:/usr/local/opt/gnu-tar/share/man:/usr/local/opt/gnu-sed/share/man:/usr/local/opt/coreutils/libexec/gnuman:/usr/share/man:/usr/local/share/man:/opt/X11/share/man:/Users/dwo3984/.nvm/versions/node/v10.9.0/share/man
