#!/bin/bash

# installs the atom editor
# this script assumes that it's run from its directory

# add package repo
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update

# install atom
sudo apt-get install -y atom

# install my settings and config
./install_atom_config.sh
