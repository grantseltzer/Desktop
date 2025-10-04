export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=$(tty)
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
function c() {
	builtin cd $@ && ls
}
plugins=(
  colored-man-pages
)
source $ZSH/oh-my-zsh.sh
