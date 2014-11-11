#!/bin/bash
############################
# bootstrap.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/.dotfiles
############################

# dotfiles directory
dir=~/.dotfiles
# old dotfiles backup directory
olddir=~/.dotfiles_old
# list of files/folders to symlink in homedir
files=(".bashrc" ".vimrc.bundle.local" ".vimrc.local" ".zshrc")

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file $olddir/
done

# install oh-my-zsh
cd
curl -L http://install.ohmyz.sh | sh

# install seydoggy zsh theme
ln -s ~/.dotfiles/seydoggy.zsh-theme ~/.oh-my-zsh/themes/

# install spf13-vim
cd
curl http://j.mp/spf13-vim3 -L -o - | sh

# install watchforchanges vim script
ln -s ~/.dotfiles/watchforchanges ~/.vim/bundle/

# create symlinks 
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
