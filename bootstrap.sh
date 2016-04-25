#!/bin/bash

# Oh My Vim
#
rm -rf ~/.oh-my-vim
#
git clone https://github.com/gavin-hu/oh-my-vim.git ~/.oh-my-vim
#
sh ~/.oh-my-vim/oh-my-vim.sh install

# Vbundle
rm -rf ~/.vim
#
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#
vim +PluginInstall +qall
