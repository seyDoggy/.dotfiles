#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt install zsh tmux xclip curl htop vim-gnome
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g npm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
echo 2 | sudo tee /sys/modules/hid_apple/parameters/fnmode
