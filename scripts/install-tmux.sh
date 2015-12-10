#!/bin/sh

sudo apt-get install tmux
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
cp tmuxifier_layouts/*.window.sh ../.tmuxifier/layouts/
