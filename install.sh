#!/bin/bash

############################################################
###################### install packages ####################
sudo apt update
sudo apt install git emacs zsh pylint python-pip python3-pip python3-gpg synaptic gnome-terminal imagemagick curl exfat-utils gthumb konversation unrar fbreader gimp vlc software-properties-common apt-transport-https wget



########################### git ############################
# set up git
# (does NOT set email address - I don't want it in the repo for privacy reasons)
# to set the email address, run
# git config --global user.email "EMAIL_HERE"
git config --global user.name "Krystof Litomisky"
git config --global core.editor "emacs -nw"
git config --global push.default matching



###################### visual studio code ##################
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code



########################### zsh ############################
# download Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# put the appropriate files in this directory where they need to be
cp ./.clear.py ./.zshrc ./.bashrc ./.emacs ./.gdbinit ~
cp krystof-bira.zsh-theme krystof-simple.zsh-theme ~/.oh-my-zsh/themes

# change the default shell to zsh
chsh -s $(which zsh)
