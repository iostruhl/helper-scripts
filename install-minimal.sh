#!/bin/bash

set -e

if [ -d "${HOME}/.vim/autoload" ] || [ -d "${HOME}/.vim/bundle" ]; then
    echo "Vim install already detected. Remove and reinstall? [yN]"
    read -n1 response
    if [ "$response" == "y" ] || [ "$response" == "Y" ]; then
        echo "Reinstalling."
        rm -rf ~/.vim/*
    else
        echo "Aborting."
        exit 1
    fi
fi

echo "Creating ~/.vim directories..."
mkdir -p ~/.vim/autoload ~/.vim/bundle

echo "Installing pathogen..."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Downloading vimrc..."
curl -LSso ~/.vimrc https://raw.githubusercontent.com/iostruhl/vim-setup/master/.vimrc

echo "Cloning packages..."
git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
git clone https://github.com/bfrg/vim-cpp-modern.git ~/.vim/bundle/vim-cpp-modern
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/rhysd/vim-clang-format.git ~/.vim/bundle/vim-clang-format
git clone https://github.com/vim-scripts/toggle_comment.git ~/.vim/bundle/toggle_comment

echo "Done."

