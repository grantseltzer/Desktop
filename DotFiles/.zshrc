export ZSH=/home/grant/.oh-my-zsh
export GPG_TTY=$(tty)
export GOPATH=/home/grant/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GO111MODULE=on

function c() {
	builtin cd $@ && ls
}

function pwgen() {
        < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$@};echo;
}

alias xpn='expressvpn'

alias rcon='docker run --rm -e DISABLE_AUTH=true -e ROOT=true -p 8787:8787 -v /home/grant/R:/home/rstudio/R docker.io/rocker/tidyverse'
alias rbook='docker run --rm -v /home/grant/R:/home/jovyan/R --net=host jupyter/r-notebook'
	
# utility aliases
alias disas='objdump -M intel -d'
alias synctime="sudo ntpdate north-america.pool.ntp.org"

# Git aliases
alias gs="git status"
alias gp="git pull"
alias gc="git commit -s -m"
alias gco="git checkout"
alias gl="git log"
alias gd="git diff"
alias ga="git add" 
alias gps="git push"

# Docker aliases
alias dcu="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm ;docker system prune -af"
alias dps="docker ps -a --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\""

ZSH_THEME="seltzer"

# Source non-standard rc files
source ~/.zshrc_temp

# Completion: 
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git,
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
