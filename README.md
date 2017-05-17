# dotfiles
Configuration for various things



# Things to do after installing ubuntu

* enable workspaces
  (Appearance -> Behavior -> Enable workspaces)
* change window menus to be in the window, not at the top title bar
  (Appearance -> Behavior -> Show the menus for a window -> In the window's title bar)
* Remove the new gnome software center and install the old one
  (gnome fails to install external packages)

        sudo apt purge gnome-software
        sudo apt install software-center

* install Chrome
* install packages

        sudo apt-get install git emacs24 zsh pylint python-pip python3-pip synaptic gnome-terminal imagemagick ruby ruby-dev

* fix privacy hole (https://fixubuntu.com/)
* add more workspaces (through Unity Tweak Tool, installed in above step)
* change terminal background, enable unlimited scrolling
* disable sound effects (settings -> sound -> sound effects -> mute)


## Nvidia drivers

The results with Nvidia drivers are sometimes unpredictable.
If you feel a need to install them, one way to do it is

    sudo apt-get install nvidia-current


## grub customizer

Dual-booting? Install grub customizer:

    sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
    sudo apt-get update
    sudo apt-get install grub-customizer


## dotfiles

Clone this repo.

### Set up zsh as the default shell

Get Oh-My-Zsh:

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

Copy over config files from this repo:

    cp .zshrc ~
    cp krystof-simple.zsh-theme krystof-bira.zsh-theme ~/.oh-my-zsh/themes

Change the default shell to zsh:

    chsh -s $(which zsh)


### Set up the other config files from this repo

    cp .bashrc .emacs .gdbinit .pylintrc ~




### emacs

Install flycheck:

    M-x package-install <RET> flycheck


### git

    git config --global user.email "my@email.com"
    git config --global user.name "Krystof Litomisky"
    git config --global core.editor "emacs -nw"
    git config --global push.default matching

Make an ssh key & add it to github:
(details at https://help.github.com/articles/generating-ssh-keys/)

    ssh-keygen -t rsa -b 4096 -C "EMAIL_ADDRESS | COMPUTER_NAME"
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa

Then add the key on github.com
