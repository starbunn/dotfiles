#!/bin/sh

# this require paru to be already installed

paru -Syy
paru -Syu
paru -S nvimpager zsh neovim httpie bat fzf fd ripgrep starship kitty firefox tmux exa git zoxide openssh shellcheck jq curl git asdf-vm
paru -Syyu lightly-qt


paru -S snapd
sudo systemctl enable --now snapd
snap install universal-ctags

curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/install.sh | sh

spicetify
spicetify backup apply enable-devtool
spicetify config current_theme catppuccin
spicetify config color_scheme lavender
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify config extensions catppuccin.js
SPICE_PATH="~/.config/spicetify"
sudo ln -s $SPICE_PATH/Themes/catppuccin/catppuccin.js $SPICE_PATH/Extensions
