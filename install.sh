#!/bin/bash
# Installs the configuration scripts in this repo
files=(".bashrc" ".bash_profile" ".dir_colors" ".emacs" ".gitconfig" ".gitignore_global" ".nanorc" ".zshrc")

echo "This script will replace the following files, if they exist:"
for i in $files; do
    echo "- ~/$i"
done
read -n 1 -p "Are you sure you want to continue? [y/n] " yn

case $yn in
    [Yy]* ) echo; echo "Installing...";;
    * ) exit;;
esac

for i in $files; do
    ln -sf "./$i" "~/$i"
done

