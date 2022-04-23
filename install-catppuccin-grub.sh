gh repo clone cattpuccin/grub /tmp/catgrub
sudo cp -r /tmp/catgrub/catppuccin-grub-theme /usr/share/grub/themes
sudo cp -r ~/.config/grubfile /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
