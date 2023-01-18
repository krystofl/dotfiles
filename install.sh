#!/usr/bin/env bash

# exit on errors
set -e -u -o pipefail
shopt -s failglob

script_dir=$(dirname "$0"); cd "$script_dir" || exit 1; script_dir=$(pwd)

#===============================================================================
# in : $@ (same as the script)
# out: exit_code
main () {

    parse_args "$@"

    # check if we're on WSL; sets $ON_WSL
    # this is then used by some of the below functions
    check_wsl

    install_packages

    install_docker

    install_editors

    set_gnome_settings

    setup_git

    setup_python

    setup_zsh

    install_dotfiles

    # if we got here, all is well
    exit_code=0
}


#===============================================================================
# Parse arguments
# in : $@ (same as the script)
# out: GIT_EMAIL
parse_args() {

    # email to use for git config
    GIT_EMAIL=''

    while [ "$#" != 0 ]; do
        case "$1" in
        -e|--email)
            GIT_EMAIL="$2"; shift 2 ;;
        -h|--help)
            usage; exit 0 ;;
        *)
            log_error "Unknown argument \"$1\""; usage; exit 1 ;;
        esac
    done
}


# =============================================================================
# print out usage info
# in : none
# out: none
usage () {
    echo "Usage: $0 <options>"
    echo
    echo "Options:"
    echo "  -e, --email : email address to set globally for git user.email"
    echo "  -h, --help  : print this help message and exit"
}


# =============================================================================
# install packages
# in : ON_WSL
# out: none
install_packages () {
    log_info "\n\nInstalling packages..."
    sudo apt update
    sudo apt install -y git zsh pylint python3-pip python3-gpg \
                        gnome-terminal imagemagick curl \
                        software-properties-common apt-transport-https wget \
                        tmux mlocate tree net-tools unrar

    # if not on WSL, install some additional packages
    if [ "$ON_WSL" = false ] ; then
        sudo apt install -y gimp vlc synaptic gnome-tweak-tool \
                            chrome-gnome-shell fbreader gthumb
    fi
}


# =============================================================================
# set some ubuntu settings
# in : ON_WSL
# out: none
set_gnome_settings () {
    if [ "$ON_WSL" = false ] ; then
        log_info "Setting some gnome settings..."

        # show the date in the top panel
        gsettings set org.gnome.desktop.interface clock-show-date true

        # turn on warmer screen colors at night between sunset and sunrise
        gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
        gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true
        gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 4000
    fi
}


# =============================================================================
# setup git
# in : GIT_EMAIL
# out: none
setup_git () {
    log_info "\n\nSetting git config..."

    if [ -n "$GIT_EMAIL" ] ; then
        log_info "Setting git user.email to $GIT_EMAIL"
        git config --global user.email "$GIT_EMAIL"
    fi

    git config --global user.name "Krystof Litomisky"
    git config --global core.editor "emacs -nw"
    git config --global push.default matching
}

# =============================================================================
# setup zsh
# in : none
# out: none
setup_zsh () {
    log_info "\n\nInstalling and setting up zsh..."

    download Oh-My-Zsh
    curl -Lo install_oh-my-zsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    sh ./install_oh-my-zsh.sh --unattended

    # zsh theme
    cp krystof-bira.zsh-theme krystof-simple.zsh-theme ~/.oh-my-zsh/themes

    # change the default shell to zsh
    chsh -s $(which zsh)
}


# =============================================================================
# install dotfiles
# in : none
# out: none
install_dotfiles () {
    log_info "\n\nInstalling dotfiles..."
    cp ./.zshrc ./.bashrc ./.gdbinit ./.pylintrc ~
}


# =============================================================================
# Setup python
# in : none
# out: none
setup_python () {
    log_info "\n\nInstalling python packages..."

    # set python3 as the preferred option when running "python"
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

    sudo pip3 install virtualenv virtualenvwrapper
}


# =============================================================================
# Install Docker
# in : none
# out: none
install_docker () {
    # from https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

    log_info "\n\nInstalling docker..."
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
    log_info "NOTE: to finish docker installation, you need to log out and back in."
}


# =============================================================================
# Install editors
# in : ON_WSL
# out: none
install_editors () {

    # install emacs and its customizations
    log_info "\n\nInstalling emacs..."
    pushd emacs
    ./install_emacs.sh
    popd # back here

    # if not on WSL, also install VS Code
    if [ "$ON_WSL" = false ] ; then

        # install VS Code
        echo -e "\n\nInstalling VS Code..."
        pushd visual_studio_code
        ./install_VS_Code.sh
        popd # back here

        # install atom and its customizations
        #echo -e "\n\nInstalling Atom..."
        #pushd atom
        #./install_atom.sh
        #popd # back here
    fi
}


# =============================================================================
# Check if we are running on WSL, and set $ON_WSL
# in : none
# out: ON_WSL
check_wsl () {
    if [ -e /proc/sys/fs/binfmt_misc/WSLInterop ] ; then
        log_info "Running on WSL\n\n"
        ON_WSL=true
    else
        ON_WSL=false
    fi
}


# =============================================================================
# called in case of exit due to an error
wrap_up () {
    # set the exit code to the result of the last command that ran
    exit_code=$?
}


# =============================================================================
# script starts running here ==================================================
# =============================================================================

# if any errors happen, call wrap up before exiting
trap 'wrap_up' EXIT

source "$script_dir"/utils.sh

# call the main() function
main "$@"

# exit_code is set to 0 at the end of main,
# or nonzero by any command that fails
exit $exit_code