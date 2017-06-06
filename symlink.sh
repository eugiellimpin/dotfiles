#!/bin/bash

PROJECT_DIR=$HOME/code/dotfiles

ln -sfFhv $PROJECT_DIR/vimrc ~/.vimrc
ln -sFfhv $PROJECT_DIR/vim/after ~/.vim/after
ln -sFfhv $PROJECT_DIR/vim/ftdetect ~/.vim/ftdetect
ln -sFfhv $PROJECT_DIR/mux ~/.tmuxinator
ln -sfFhv $PROJECT_DIR/tmux.conf ~/.tmux.conf
ln -sfFhv $PROJECT_DIR/tmuxcolors-solarized-dark.conf ~/.tmuxcolors-solarized-dark.conf
ln -sfFhv $PROJECT_DIR/config.fish ~/.config/fish/config.fish
ln -sfFhv $PROJECT_DIR/gitconfig ~/.gitconfig
ln -sfFhv $PROJECT_DIR/agignore ~/.agignore
ln -sfFhv $PROJECT_DIR/tmuxline ~/.tmuxline
ln -sfFhv $PROJECT_DIR/vim/UltiSnips ~/.vim/UltiSnips
ln -sfFhv $PROJECT_DIR/git_templates/hooks ~/.git_templates/hooks
