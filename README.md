# dotfiles
Configuration for various things

*NOTE: this is written for Ubuntu 18.04 or higher*


# Things to do after installing ubuntu

* [install Chrome](https://www.google.com/chrome/?brand=CHBD)
* install packages

        sudo apt-get install git emacs zsh pylint python-pip python3-pip python3-gpg synaptic gnome-terminal imagemagick curl exfat-utils gthumb konversation

* change terminal background, enable unlimited scrolling
* disable sound effects (settings -> sound -> sound effects -> mute)
* revert to traditional Alt-Tab behavior:
  * go to settings -> Keyboard. In the Navigation section...
    * disable the shortcut for "Switch applications"
    * set the shortcut for "Switch windows" to Alt + Tab
* [install Dropbox](https://www.dropbox.com/install-linux)
* [install Signal](https://signal.org/download/)
* [install Nord VPN](https://nordvpn.com/download/linux/)


## workspaces
18.04 redid workspaces, and they now suck. The convoluted process described below seems to be the simplest way to get a grid of workspaces (as was easy under Unity).

* `sudo apt install gnome-tweak-tool`
* launch it (called `Tweaks`)
* Under Workspaces, select `Static Workspaces` and `Workspaces span displays`

For 18.04:
* `sudo apt install chrome-gnome-shell`
* install the Chrome Extension: https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep
* go to https://extensions.gnome.org/extension/484/workspace-grid/
* install the extension by clicking the toggle
* go back to `Tweaks` -> Extensions -> click the gear (settings) icon for `Workspace grid`, and configure as desired

For 19.04 and higher:
https://extensions.gnome.org/extension/1485/workspace-matrix/



## dotfiles

Clone this repo.

### Set up zsh as the default shell, copy config files, set some github settings

    ./install.sh



### emacs

Install flycheck:

    M-x package-install <RET> flycheck


### git

If you already ran `install.sh`, all you need to run is:

    git config --global user.email "EMAIL_HERE"

If you haven't (and don't want to) run `install.sh`, also run these:

    git config --global user.name "Krystof Litomisky"
    git config --global core.editor "emacs -nw"
    git config --global push.default matching

Make an ssh key & add it to github
[detailed instructions](https://help.github.com/articles/generating-ssh-keys/):

    ssh-keygen -t rsa -b 4096 -C "EMAIL_ADDRESS | COMPUTER_NAME"
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa

Then add the key on [github](https://github.com/settings/keys)

Check the connection: `ssh -T git@github.com`


## Switch to lightdm

Ubuntu now uses GDM (GNOME Display Manager) for the login display manager, and it sucks.
You can swich to lightdm by running

   sudo apt-get install lightdm

and then selecting `lightdm` as the default display manager.
Then `sudo service gdm3 stop` and `sudo service ligthdm start`, or just restart the computer.



## Nvidia drivers

The results with Nvidia drivers are sometimes unpredictable.
If you feel a need to install them, one way to do it is

    sudo apt-get install nvidia-current


## grub customizer

Dual-booting? Install grub customizer:

    sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
    sudo apt-get update
    sudo apt-get install grub-customizer


## Video editing

If you have a beefy computer with a dedicated graphics card, DaVinci Resolve is a great option. Note that installation on Ubuntu is not quite simple - look up "Install DaVinci Resolve on Ubuntu" to get started.

Otherwise, kdenlive is a good option. Also install `breeze` to enable nicer themes.

    sudo apt-get install kdenlive breeze

