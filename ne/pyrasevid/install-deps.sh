#!/bin/sh

# paru
[ "$(which paru)" ] && sudo paru -S ttfautohint

# Arch Linux
sudo pacman -S fontforge nodejs

