# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="seydoggy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew mercurial node npm web-search)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# PATH latex
export PATH="/usr/texbin:$PATH"

# PATH Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# PATH npm
#export PATH="/usr/local/share/npm/bin:$PATH"

# PATH MAMP PHP
export PATH="/Applications/MAMP/bin/php/php5.5.14/bin:$PATH"

# PATH Android SDK
export PATH="/Users/adam/Library/Android:$PATH"

# tmuxifier Path
export PATH="$HOME/.tmuxifier/bin:$PATH"

# composer path
export PATH="$HOME/.composer/vendor/bin:$PATH"

# latest git from homebrew
export PATH="/usr/local/Cellar/git/2.5.2/bin:$PATH"

# NodeJS Path
export NODE_PATH="/usr/lib/node:/usr/lib/node_modules"

# Manpages Path
export MANPATH="/usr/local/man:$MANPATH"

# PATH Ruby 2.2.3 GEMS
export PATH="$HOME/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    #export EDITOR='mvim -f -c "au VimLeave * !open -a iTerm"'
    export EDITOR='vim'
fi

# init tmuxifier
eval "$(tmuxifier init -)"

# open in vimr
alias vimr="open -a VimR"

# open tmux as 256 colors
alias tmux="TERM=screen-256color-bce tmux"

# open v_3 tmuxifier layout
alias v3="tmuxifier load-window v_3"

# open h_3 tmuxifier layout
alias h3="tmuxifier load-window h_3"

# open v_4 tmuxifier layout
alias v4="tmuxifier load-window v_4"

# open h_4 tmuxifier layout
alias h4="tmuxifier load-window h_4"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

