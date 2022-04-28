#!/bin/sh
# this require paru to be already installed

paru -S snapd
sudo systemctl enable --now snapd
snap install universal-ctags
