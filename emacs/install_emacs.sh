#!/usr/bin/env bash

# install emacs and my emacs settings and config


############### install the latest version of emacs ############################
# (this will need to be updated on future major version releases)
sudo add-apt-repository ppa:kelleyk/emacs -y
sudo apt-get update
sudo apt install -y emacs28



############################ install my config #################################
mkdir -p ~/.emacs.d
cp ./init.el Cask ~/.emacs.d/



######################### install packages #####################################
# use Cask - https://github.com/cask/cask
# install cask
git clone https://github.com/cask/cask
mkdir -p ~/.local/bin
make -C cask install
export PATH="$HOME/.local/bin:$PATH"

# install packages using cask
pushd ~/.emacs.d
cask install
popd # back to here

# install a markdown renderer - needed by the markdown-mode package
#sudo apt install markdown

