#!/bin/bash

# download Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# put the appropriate files in this directory where they need to be
cp ./.clear.py ./.zshrc ./.bashrc ./.emacs ./.gdbinit ~
cp krystof-bira.zsh-theme krystof-simple.zsh-theme ~/.oh-my-zsh/themes

# change the default shell to zsh
chsh -s $(which zsh)
