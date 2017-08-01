# ZSH
## Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"
plugins=(git node npm web-search bower)

## Set name of the theme to load.
## Look in ~/.oh-my-zsh/themes/
## Optionally, if you set this to "random", it'll load a random theme each
## time that oh-my-zsh is loaded.
ZSH_THEME="seydoggy"

source $ZSH/oh-my-zsh.sh

# ALIAS
alias vim="gvim -v"
alias zshconfig="gvim -v ~/.zshrc"
alias tmux="TERM=screen-256color tmux"
alias v3="tmuxifier load-window v_3"
alias h3="tmuxifier load-window h_3"
alias v4="tmuxifier load-window v_4"
alias h4="tmuxifier load-window h_4"
alias h6="tmuxifier load-window h_6"
alias ide="tmuxifier load-window javaIDE"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

#PATH
## tmuxifier Path
export PATH="$HOME/.tmuxifier/bin:$PATH"
# tmuxifier layout Path
export TMUXIFIER_LAYOUT_PATH="$HOME/.dotfiles/tmuxifier_layouts"

# EDITOR
export VISUAL=vim
export EDITOR="$VISUAL"

# init tmuxifier
eval "$(tmuxifier init -)"

# adb
if [ -d "$HOME/Android/Sdk/platform-tools" ] ; then
    export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi

# special dir colors used with the solarized theme
eval `dircolors $HOME/.dir_colors/dircolors`

##/
# EXAMPLE CONFIGS
#/

# Example aliases
# alias zshconfig="gvim -v ~/.zshrc"
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
# plugins=(git node npm web-search bower)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
