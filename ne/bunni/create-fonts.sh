#!/bin/bash

rm -rf iosevka
/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME submodule update --init --recursive
./del-fonts.sh
rm -rf $HOME/.local/share/fonts/bunnifonts/*
./build-fonts.sh "$1"
./copy-fonts.sh
