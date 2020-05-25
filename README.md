# dotfiles
Configuration for various things

*NOTE: this is targeted for Ubuntu 20.04*


# Install packages and dotfiles

Change the terminal background and enable unlimited scrolling.

## Make an ssh key & add it to github
[Detailed instructions](https://help.github.com/articles/generating-ssh-keys/):

    ssh-keygen -t rsa -b 4096 -C "EMAIL_ADDRESS | COMPUTER_NAME"
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa

Then add the key on [github](https://github.com/settings/keys)

Check the connection: `ssh -T git@github.com`


## Install packages and settings

    sudo apt install git
    git clone git@github.com:krystofl/dotfiles.git && cd dotfiles
    ./install.sh



# Other things to do after installing ubuntu

* disable sound effects (settings -> sound -> sound effects -> mute)
* [install Dropbox](https://www.dropbox.com/install-linux)
* [install Signal](https://signal.org/download/)
* [install Nord VPN](https://nordvpn.com/download/linux/)
* [install VeraCrypt](https://www.veracrypt.fr/en/Downloads.html)


## Workspaces

18.04 redid workspaces, and they now suck. The convoluted process described below seems to be the simplest way to get a grid of workspaces (as was easy under Unity).

Note that this uses `gnome-tweak-tool` and `chrome-gnome-shell`,
which get installed by `install.sh`

* launch the `gnome-tweak-tool` aka *Tweaks*
* Under Workspaces, select `Static Workspaces` and `Workspaces span displays`
* Install the GNOME Shell Integration browser extension for
  [Firefox](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration) or
  [Chrome](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)


For 19.04 and higher:
* Go to https://extensions.gnome.org/extension/1485/workspace-matrix/ and
  install the extension
* configure workspaces from Tweaks -> Extensions -> Workspace Matrix (gear icon).
  Note the number of workspaces here must match the number set in
  Tweaks -> Workspaces

For 18.04:
* Install the GNOME extension: https://extensions.gnome.org/extension/484/workspace-grid/
* go back to `Tweaks` -> Extensions -> click the gear (settings) icon for `Workspace grid`, and configure as desired


## git

If you already ran `install.sh`, all you need to run is:

    git config --global user.email "EMAIL_HERE"

If you haven't (and don't want to) run `install.sh`, also run these:

    git config --global user.name "Krystof Litomisky"
    git config --global core.editor "emacs -nw"
    git config --global push.default matching



## Python

`install.sh` installs Python's virtualenv and virtualenvwrapper libs, but there is a problem: virtualenvwrapper wants to run for the result of `which python`, but Atom forces `python` to be `python2`, while we want to use virtualenvwrapper for `python3`.

To fix this, edit `/usr/local/bin/virtualenvwrapper.sh` to tell it to look for `python3`. The relevant line (line no. 50 as of this writing) should read

    VIRTUALENVWRAPPER_PYTHON="$(command \which python3)"

...where before it looked for just `python`.

Note that the virtualenvwrapper zsh plugin will automatically activate a virtualenv that maches the name of a directory, or you can manually set the virtualenv to activate using a `.venv` file
([docs](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/virtualenvwrapper#virtualenvwrapper-plugin)).

virtualenvwrapper command reference:
- `deactivate` - deactivate the current virtualenv
- `mkvirtualenv ENVNAME` - make a virtualenv called ENVNAME
- `rmvirtualenv ENVNAME` - delete the virtualenv ENVNAME



# Misc

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

If you have a beefy computer with a dedicated graphics card, DaVinci Resolve is a great option. Note that installation on Ubuntu is not quite simple - look up "Install DaVinci Resolve on Ubuntu" to get started; [MakeResolveDeb](https://www.danieltufvesson.com/makeresolvedeb) seems like a good option to try.

Otherwise, kdenlive is a good option. Also install `breeze` to enable nicer themes.

    sudo apt-get install kdenlive breeze


## Autokey

AutoKey is a desktop automation utility for Linux and X11.

For instructions and scripts (setup for Jeepney),
see the `jeepney/autokey` folder.
