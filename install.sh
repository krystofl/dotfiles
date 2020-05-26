#!/bin/bash

# NOTE: this script assumes that it is run from its directory (i.e. as `./install.sh`)

############################################################
###################### install packages ####################
echo "\n\nInstalling packages..."
sudo apt update
sudo apt install -y git zsh pylint python3-pip python3-gpg synaptic \
                    gnome-terminal imagemagick curl exfat-utils gthumb \
                    konversation unrar fbreader gimp vlc \
                    software-properties-common apt-transport-https wget tmux \
                    gnome-tweak-tool chrome-gnome-shell mlocate tree

# install emacs and its customizations
echo "\n\nInstalling emacs..."
pushd emacs
./install_emacs.sh
popd # back here

# install atom and its customizations
echo "\n\nInstalling Atom..."
pushd atom
./install_atom.sh
popd # back here



################### set ubuntu settings ####################
# show the date in the top panel
gsettings set org.gnome.desktop.interface clock-show-date true



######################## python ############################
sudo pip3 install virtualenv virtualenvwrapper



########################### git ############################
echo "\n\nSetting git config..."

# set up git
# (does NOT set email address - I don't want it in the repo for privacy reasons)
# to set the email address, run
# git config --global user.email "EMAIL_HERE"
git config --global user.name "Krystof Litomisky"
git config --global core.editor "emacs -nw"
git config --global push.default matching



########################### zsh ############################
echo "\n\nInstalling and setting up zsh..."

# download Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh theme
cp krystof-bira.zsh-theme krystof-simple.zsh-theme ~/.oh-my-zsh/themes

# change the default shell to zsh
chsh -s $(which zsh)



################# install dotfiles #########################
echo "\n\nInstalling dotfiles..."
cp ./.clear.py ./.zshrc ./.bashrc ./.gdbinit ./.pylintrc ~
