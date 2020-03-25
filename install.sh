#!/bin/bash

# NOTE: this script assumes that it is run from its directory (i.e. as `./install.sh`)

############################################################
###################### install packages ####################
echo "\n\nInstalling packages..."
sudo apt update
sudo apt install git emacs zsh pylint python-pip python3-pip python3-gpg synaptic gnome-terminal imagemagick curl exfat-utils gthumb konversation unrar fbreader gimp vlc software-properties-common apt-transport-https wget



################# install dotfiles #########################
echo "\n\nInstalling dotfiles..."
cp ./.clear.py ./.zshrc ./.bashrc ./.emacs ./.gdbinit ~



########################### git ############################
echo "\n\nSetting git config..."

# set up git
# (does NOT set email address - I don't want it in the repo for privacy reasons)
# to set the email address, run
# git config --global user.email "EMAIL_HERE"
git config --global user.name "Krystof Litomisky"
git config --global core.editor "emacs -nw"
git config --global push.default matching



###################### visual studio code ##################
echo "\n\nInstalling Visual Studio Code"

# install visual studio code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# install settings and keybindings
cp ./.config/Code/User/*.json ~/.config/Code/User/

# install extensions
# from https://superuser.com/a/1452176/
# to generate vs_code_extensions_list.txt, run
# `rm vs_code_extensions_list.txt && code --list-extensions >> vs_code_extensions_list.txt`
cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension



########################### zsh ############################
echo "\n\nInstalling and setting up zsh..."

# download Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh theme
cp krystof-bira.zsh-theme krystof-simple.zsh-theme ~/.oh-my-zsh/themes

# change the default shell to zsh
chsh -s $(which zsh)
