#!/bin/bash
############################
# bootstrap.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/.dotfiles
############################
# dotfiles directory
dir="$HOME/.dotfiles"
# old dotfiles backup directory
olddir="$HOME/.dotfiles_old"
# list of files/folders to symlink in homedir
files=".bashrc
.vimrc.bundles.local
.vimrc.local
.zshrc"

# create dotfiles_old in homedir
echo "###################################"
echo "Creating $olddir for backup of any existing dotfiles in $HOME"
rm -rf $olddir
mkdir -p $olddir

# install oh-my-zsh
cd
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "###################################"
    echo "Installing oh-my-zsh"
    curl -L http://install.ohmyz.sh | sh
fi

echo "###################################"
echo "install seydoggy zsh theme"
# if file exists and is not a symlink
if [ -e "$HOME/.oh-my-zsh/themes/seydoggy.zsh-theme" ]; then
    if [ ! -h "$HOME/.oh-my-zsh/themes/seydoggy.zsh-theme" ]; then
        mv $HOME/.oh-my-zsh/themes/seydoggy.zsh-theme $HOME/.dotfiles_old/
    else # remove symlink
        rm -rf $HOME/.oh-my-zsh/themes/seydoggy.zsh-theme
    fi
fi

ln -s $dir/seydoggy.zsh-theme $HOME/.oh-my-zsh/themes/seydoggy.zsh-theme
if [ -h $HOME/.oh-my-zsh/themes/seydoggy.zsh-theme ]; then
    echo "symlink to $HOME/.oh-my-zsh/themes/seydoggy.zsh-theme created."
else
    echo "Could not create symlink to $HOME/.oh-my-zsh/themes/seydoggy.zsh-theme"
fi

# install spf13-vim
cd
if [ ! -d "$HOME/.spf13-vim-3" ]; then
    echo "###################################"
    echo "Installing spf13-vim"
    curl http://j.mp/spf13-vim3 -L -o - | sh
fi

echo "###################################"
echo "install watchforchanges vim script"
# if dir exists and is not a symlink
if [ -d "$HOME/.vim/bundle/watchforchanges" ]; then
    if [ ! -h "$HOME/.vim/bundle/watchforchanges" ]; then
        echo "$HOME/.vim/bundle/watchforchanges is not a symlink... moving to $olddir"
        mv $HOME/.vim/bundle/watchforchanges $HOME/.dotfiles_old/
    else # remove symlink
        echo "$HOME/.vim/bundle/watchforchanges is a symlink... removing."
        rm -rf $HOME/.vim/bundle/watchforchanges
    fi
fi

ln -s $dir/watchforchanges $HOME/.vim/bundle/watchforchanges
if [ -h $HOME/.vim/bundle/watchforchanges ]; then
    echo "symlink to $HOME/.vim/bundle/watchforchanges created."
else
    echo "Could not create symlink to $HOME/.vim/bundle/watchforchanges"
fi

# create symlinks 
for file in $files; do
    echo "###################################"
    echo "Handling $file..."

    # if file exists and is not a symlink
    if [ -e "$HOME/$file" ]; then
        echo "Moving $file from $HOME to $olddir"

        if [ ! -h "$HOME/$file" ]; then
            echo "$file is not a symlink... moving to $olddir"
            mv $HOME/$file $olddir/
        else
            echo "$file is a symlink... removing."
            rm -rf $HOME/$file
        fi
    fi

    echo "Creating symlink to $dir/$file in $HOME directory."
    ln -s $dir/$file $HOME/$file
    if [ -h $HOME/$file ]; then
        echo "symlink to $HOME/$file created."
    else
        echo "Could not create symlink to $HOME/$file"
    fi
done

# install bundles
cd $HOME/.spf13-vim-3
git pull
vim +BundleInstall! +BundleClean +qa!
