#!/bin/bash

# install emacs and my emacs settings and config


############### install the latest version of emacs ############################
# (this will need to be updated on future major version releases)
sudo add-apt-repository ppa:kelleyk/emacs -y
sudo apt-get update
sudo apt install -y emacs26



############################ install my config #################################
mkdir -p ~/.emacs.d
cp ./init.el Cask ~/.emacs.d/



######################### install packages #####################################
# use Cask - https://github.com/cask/cask
# install cask
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
export PATH="$HOME/.cask/bin:$PATH"

# install packages using cask
pushd ~/.emacs.d
cask install
popd # back to here

# install a markdown renderer - needed by the markdown-mode package
#sudo apt install markdown
