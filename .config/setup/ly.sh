#!/bin/sh
git clone --recurse-submodules https://github.com/nullgemm/ly.git
cd ly
make
sudo make install
sudo systemctl enable ly.service

sudo rm -rf /etc/ly/config.ini
sudo cp ./ly.ini /etc/ly/config.ini
