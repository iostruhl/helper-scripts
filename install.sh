#!/bin/bash

set -e

echo "Creating ~/.vim directories..."
mkdir -p ~/.vim/autoload ~/.vim/bundle

echo "Installing pathogen..."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Downloading vimrc..."
curl -LSso ~/.vimrc https://raw.githubusercontent.com/iostruhl/vim-setup/master/.vimrc

echo "Done."

