#!/bin/bash

set -euxo pipefail

if [ -d "${HOME}/.vim/autoload" ] || [ -d "${HOME}/.vim/bundle" ]; then
    echo "Vim install already detected. Removing and reinstalling."
    rm -rf ~/.vim/*
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

curl -LSso ~/.vimrc https://raw.githubusercontent.com/iostruhl/vim-setup/master/.vimrc

git clone https://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
git clone https://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
git clone https://github.com/bfrg/vim-cpp-modern.git ~/.vim/bundle/vim-cpp-modern
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/vim-scripts/toggle_comment.git ~/.vim/bundle/toggle_comment

