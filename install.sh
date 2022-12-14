#!/usr/bin/env bash


# NOTE: this script assumes that it is run from its directory (i.e. as `./install.sh`)

############################################################
###################### install packages ####################
echo -e "\n\nInstalling packages..."
sudo apt update
sudo apt install -y git zsh pylint python3-pip python3-gpg synaptic \
                    gnome-terminal imagemagick curl exfat-utils gthumb \
                    unrar fbreader gimp vlc \
                    software-properties-common apt-transport-https wget tmux \
                    gnome-tweak-tool chrome-gnome-shell mlocate tree net-tools

# set python3 as the preferred option when running "python"
# sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10



######################## docker ############################
# from https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

echo -e "\n\nInstalling docker..."
# install prereqs
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" -y

# update package index and install docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# allow running docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# log in to the new group "docker"
# this starts a new session, so it's undesirable in a script
# newgrp docker
echo "NOTE: to finish docker installation, you need to log out and back in."


###################### install editors ####################
# install emacs and its customizations
echo -e "\n\nInstalling emacs..."
pushd emacs
./install_emacs.sh
popd # back here

# install atom and its customizations
#echo -e "\n\nInstalling Atom..."
#pushd atom
#./install_atom.sh
#popd # back here

# install VS Code
echo -e "\n\nInstalling VS Code..."
pushd visual_studio_code
./install_VS_Code.sh
popd # back here



################### set ubuntu settings ####################
# show the date in the top panel
gsettings set org.gnome.desktop.interface clock-show-date true

# turn on warmer screen colors at night between sunset and sunrise
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 4000



######################## python ############################
echo -e "\n\nInstalling python packages..."
sudo pip3 install virtualenv virtualenvwrapper



########################### git ############################
echo -e "\n\nSetting git config..."

# set up git
# (does NOT set email address - I don't want it in the repo for privacy reasons)
# to set the email address, run
# git config --global user.email "EMAIL_HERE"
git config --global user.name "Krystof Litomisky"
git config --global core.editor "emacs -nw"
git config --global push.default matching



########################### zsh ############################
echo -e "\n\nInstalling and setting up zsh..."

# download Oh-My-Zsh
curl -Lo install_oh-my-zsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh ./install_oh-my-zsh.sh --unattended

# zsh theme
cp krystof-bira.zsh-theme krystof-simple.zsh-theme ~/.oh-my-zsh/themes

# change the default shell to zsh
chsh -s $(which zsh)



################# install dotfiles #########################
echo -e "\n\nInstalling dotfiles..."
cp ./.zshrc ./.bashrc ./.gdbinit ./.pylintrc ~
