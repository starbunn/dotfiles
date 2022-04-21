#!/bin/sh

# this require paru to be already installed

paru -Syy
paru -Syu
paru -S nvimpager zsh neovim httpie bat fzf fd ripgrep starship kitty firefox tmux exa nvm git zoxide openssh


paru -S snapd
sudo systemctl enable --now snapd
snap install universal-ctags
