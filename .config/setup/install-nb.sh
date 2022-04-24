#!/bin/sh
paru -S bat pandoc ripgrep tig w3m nmap

sudo curl -L https://raw.github.com/xwmx/nb/master/nb -o /usr/local/bin/nb &&
    sudo chmod +x /usr/local/bin/nb &&
    sudo nb completions install --download
