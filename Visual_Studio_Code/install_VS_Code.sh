#!/bin/bash

# Installs Visual Studio Code and my settings and keybindings
# This script assumes it is run from its directory

echo "\n\nInstalling Visual Studio Code"

# install visual studio code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# install settings and keybindings
cp *.json ~/.config/Code/User/

# install extensions
# from https://superuser.com/a/1452176/
# to generate vs_code_extensions_list.txt, run:
# rm vs_code_extensions_list.txt && code --list-extensions >> vs_code_extensions_list.txt
cat vs_code_extensions_list.txt | xargs -n 1 code --install-extension
