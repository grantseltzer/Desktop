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

function shellgen() {
	objdump -d $@ | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//' | sed 's/$/\n/'
}

alias synctime="sudo ntpdate north-america.pool.ntp.org"
alias disas='objdump -M intel -d'
alias gs="git status"
alias gd='git diff'
alias dps="docker ps -a --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\""
alias blob='echo ༼ つ ◕_◕ ༽つ'



ZSH_THEME="seltzer"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

function releasenote() {
	git log --pretty="%h - %s (%an)" $@..HEAD
}
function provision() {
	sudo dnf update -y
	sudo dnf install -y make zsh go libbpf ntpdate libbpf-devel clang podman util-linux-user glibc-devel.i686 strace glibc-static zlib-static man-pages llvm llvm-devel git-email mutt openssl-devel tmux open-policy-agent kernel-devel-$(uname -r)
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	curl https://raw.githubusercontent.com/grantseltzer/seltzer.zsh-theme/master/seltzer.zsh-theme > $HOME/.oh-my-zsh/themes/seltzer.zsh-theme
	curl https://raw.githubusercontent.com/grantseltzer/Desktop/master/.zshrc > $HOME/.zshrc
	sudo chsh -s $(which zsh) $USER
}

plugins=(
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
