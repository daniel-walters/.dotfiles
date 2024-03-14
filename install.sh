#!/bin/bash

sudo ln -si ~/.dotfiles/alacritty ~/.config/alacritty
sudo ln -si ~/.dotfiles/tmux ~/.config/tmux
sudo ln -si ~/.dotfiles/zshrc ~/.zshrc

if [ ! -e "~/.hushlogin" ]; then
    sudo touch ~/.hushlogin
fi

brew bundle install
