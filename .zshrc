export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=$(tty)
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

function c() {
	builtin cd $@ && ls
}

function pwgen() {
        < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$@};echo;
}

alias disas='objdump -M intel -d'
alias gs="git status"
alias dps="docker ps -a --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\""

ZSH_THEME="seltzer"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
