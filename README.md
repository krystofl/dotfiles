# dotfiles
Configuration for various things

*NOTE: this is written for Ubuntu 18.04 or higher*


# Things to do after installing ubuntu

* install Chrome
* install packages

        sudo apt-get install git emacs zsh pylint python-pip python3-pip synaptic gnome-terminal imagemagick curl

* change terminal background, enable unlimited scrolling
* disable sound effects (settings -> sound -> sound effects -> mute)


## dotfiles

Clone this repo.

### Set up zsh as the default shell and copy config files

    ./install.sh



### emacs

Install flycheck:

    M-x package-install <RET> flycheck


### git

    git config --global user.email "my@email.com"
    git config --global user.name "Krystof Litomisky"
    git config --global core.editor "emacs -nw"
    git config --global push.default matching

Make an ssh key & add it to github
(details at https://help.github.com/articles/generating-ssh-keys/):

    ssh-keygen -t rsa -b 4096 -C "EMAIL_ADDRESS | COMPUTER_NAME"
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa

Then add the key on github.com

Check the connection: `ssh -T git@github.com`



## Nvidia drivers

The results with Nvidia drivers are sometimes unpredictable.
If you feel a need to install them, one way to do it is

    sudo apt-get install nvidia-current


## grub customizer

Dual-booting? Install grub customizer:

    sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
    sudo apt-get update
    sudo apt-get install grub-customizer


## Spectre

Stuff specific to my HP Spectre x360 (13t-w000 CTO) is in the `spectre` subdirectory.
