wget -qO- https://git.io/papirus-icon-theme-install | sh
git clone https://github.com/catppuccin/papirus-folders.git
cd papirus-folders
sudo cp -r src/* /usr/share/icons/Papirus
./papirus-folders -C cat-red --theme Papirus-Dark
