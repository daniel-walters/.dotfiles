#!/bin/bash

sudo ln -si nvim ~/.config/nvim
sudo ln -si alacritty ~/.config/alacritty
sudo ln -si tmux ~/.config/tmux
sudo ln -si zshrc ~/.zshrc

if [ ! -e "~/.hushlogin" ]; then
    sudo touch ~/.hushlogin
fi

sudo brew bundle install
