#!/bin/sh
gh repo clone catppuccin/sddm Catppuccin
sudo mv Catppuccin /usr/share/sddm/themes
[[ -f ~/.config/sddm_config.conf ]] && cp ~/.config/sddm_config.conf /etc/sddm.conf.d/kde_settings.conf
