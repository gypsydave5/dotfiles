## adds the gnu versions of the utils
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# MANPATH="/usr/local/opt/gnu-sed/share/man:$MANPATH"
# MANPATH="/usr/local/opt/gnu-tar/share/man:$MANPATH"
# MANPATH="/usr/local/opt/findutils/share/man:$MANPATH"

export MAIL=/var/spool/mail/davidwic

#nvm directory
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/bin # My own special bins

# C Libraries
export LD_LIBRARY_PATH=~/lib:$LD_LIBRARY_PATH

# Ruby
export RUBIES=$HOME/.rubies
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby

#haskell - stack local directory
export PATH="$HOME/.local/bin:$PATH"

#Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib"

#dot
export GRAPHVIZ_DOT=/usr/local/opt/graphviz/bin/dot

# Perl shizzle
PATH="/Users/davidwic/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/davidwic/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/davidwic/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/davidwic/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/davidwic/perl5"; export PERL_MM_OPT;

export PATH=$PATH:/Library/TeX/texbin

# PLAN9
PLAN9=/Users/gypsydave5/dev/plan9port export PLAN9
PATH=$PATH:$PLAN9/bin export PATH

# Local bins
PATH=$PATH:~/bin

alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" > '~/.emacs.d/eshell/alias'

#NodeJS
nvm use node

[[ -s ~/.bashrc ]] && source ~/.bashrc
export PATH="$HOME/.jenv/bin:$PATH"

# opam configuration
test -r /Users/gypsydave5/.opam/opam-init/init.sh && . /Users/gypsydave5/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
