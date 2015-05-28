#!/bin/bash

tracked_files="vimrc zshrc"

dir=~/dotfiles
bak=~/dotfiles/bak

mkdir -p $bak

cd $dir

echo "Backing up existing files to $bak"
for file in $tracked_files; do
    mv ~/.$file $bak
    echo "Linking $file to ~/.$file"
    ln -s $dir/$file ~/.$file
done
echo "Done"

