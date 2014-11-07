# Adam Merrifield's bash promp color profile

# adam@local:~$
COLOR1='\[\e[0;34m\]'
COLOR2='\[\e[0;37m\]'
COLOR3='\[\e[0;32m\]'
COLOR4='\[\e[0;31m\]'
GIT_STATUS=' $(__git_ps1 "[%s]")'
PROMPT_CHAR='\$'
PS1="${COLOR1}\u@\h${COLOR2}:${COLOR3}\w${COLOR4}${GIT_STATUS}${COLOR1}${PROMPT_CHAR} ${COLOR2}"

# local:~ adam$
#PS1="\[\e[34m\]\h\[\e[00m\]:\[\e[32m\]\w \[\e[34m\]\u\[\e[00m\]\$ "

# PATH
PATH="/usr/local/bin:/usr/local/share/npm/bin:$PATH"
export PATH

# NodeJS Path
export NODE_PATH="/usr/local/lib/node"

# SUBL
#export EDITOR="/usr/local/bin/subl -nw"

# vim
export EDITOR=vim

# git completion
source ~/.git-completion.bash

# be completion
source ~/.be-completion.sh

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Generate a random password
# source: http://legroom.net/2010/05/06/bash-random-password-generator
#
#  $1 = number of characters; defaults to 32
#  $2 = include special characters; 1 = yes, 0 = no; defaults to 1
function rpg() {
  [ "$2" == "0" ] && CHAR="[:alnum:]" || CHAR="[:graph:]"
    cat /dev/urandom | LC_CTYPE=C tr -cd "$CHAR" | head -c ${1:-32} | pbcopy
    echo `pbpaste`
}

# Bash shell driver for 'go' (http://code.google.com/p/go-tool/).
function go {
    export GO_SHELL_SCRIPT=$HOME/.__tmp_go.sh
    python -m go $*
    if [ -f $GO_SHELL_SCRIPT ] ; then
        source $GO_SHELL_SCRIPT
    fi
    unset GO_SHELL_SCRIPT
}
export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### vi keybindings to terminal
set -o vi
