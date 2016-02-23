#!/bin/sh

# Debian
sudo apt-get update
sudo apt-get upgrade
sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common
sudo apt-get install vim-gnome vim-nox git zsh tmux xclip curl

