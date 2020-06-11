export ZSH=/home/gseltzerrichman/.oh-my-zsh
export GPG_TTY=$(tty)
export GOPATH=/home/gseltzerrichman/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

function c() {
	builtin cd $@ && ls
}

function pwgen() {
        < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$@};echo;
}

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

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git,
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
