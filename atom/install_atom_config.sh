#!/usr/bin/env bash

# installs the settings for Atom
# this script assumes that it's run from its directory


# install my extensions
# to generate atom_packages.list, run
# apm list --installed --bare > atom_packages.list
apm install --packages-file atom_packages.list


# install my settings and keybindings
mkdir -p ~/.atom
cp ./*.cson ./*.json ~/.atom/
