#!/bin/bash

# TODO: create variable for dotfiles src dir

ln -sfhv ~/projects/dotfiles/vimrc ~/.vimrc
ln -sFfhv ~/projects/dotfiles/vim/after ~/.vim/after
ln -sFfhv ~/projects/dotfiles/vim/ftdetect ~/.vim/ftdetect
ln -sFfhv ~/projects/dotfiles/teamocil ~/.teamocil
ln -sfhv ~/projects/dotfiles/tmux.conf ~/.tmux.conf
ln -sfhv ~/projects/dotfiles/tmuxcolors-solarized-dark.conf ~/.tmuxcolors-solarized-dark.conf
ln -sfhv ~/projects/dotfiles/config.fish ~/.config/fish/config.fish
ln -sfhv ~/projects/dotfiles/gitconfig ~/.gitconfig
