#!/bin/bash

# export Atom's current config to files in this folder so they can be used
# to update the repo

# settings
cp ~/.atom/config.cson ~/.atom/keymap.cson ~/.atom/snippets.cson ~/.atom/linter-config.json .

# package list
apm list --installed --bare > atom_packages.list
