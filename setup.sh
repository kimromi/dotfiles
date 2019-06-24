#!/bin/sh
set -x

which brew >/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.zsh ~/.zsh
ln -sf $PWD/.dircolors-solarized ~/.dircolors-solarized
ln -sf $PWD/.tmux.conf ~/.tmux.conf
ln -sf $PWD/.vimrc ~/.vimrc
ln -sf $PWD/.vim ~/.vim
ln -sf $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/.tigrc ~/.tigrc
