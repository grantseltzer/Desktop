# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "fedora/33-cloud-base"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end
 
  config.vm.provision "shell", privileged: false, inline: <<-SCRIPT
    sudo dnf update -y
    sudo dnf install -y make zsh go libbpf libbpf-devel clang podman util-linux-user glibc-devel.i686 strace glibc-static zlib-static man-pages llvm llvm-devel git-email mutt openssl-devel tmux open-policy-agent kernel-devel-$(uname -r)
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl https://raw.githubusercontent.com/grantseltzer/seltzer.zsh-theme/master/seltzer.zsh-theme > $HOME/.oh-my-zsh/themes/seltzer.zsh-theme
    curl https://raw.githubusercontent.com/grantseltzer/Desktop/master/.zshrc > $HOME/.zshrc
    sudo chsh -s $(which zsh) vagrant
  SCRIPT
end
