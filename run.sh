#!/bin/bash
# Method from github.com/robbintt - Thanks!

set -e # Do not continue on error
set -x # Show Debug

cd ~

DATE=`date +"%Y%m%d"`
OLD_DOTFILES=~/.old_dotfiles/$DATE

# Ensure folders in old dotfiles folder
mkdir -p $OLD_DOTFILES
mkdir -p $OLD_DOTFILES/git
mkdir -p $OLD_DOTFILES/i3
mkdir -p $OLD_DOTFILES/i3status
mkdir -p $OLD_DOTFILES/redshift

# Ensure destination folders
mkdir -p ~/.config/i3

# Copy old configs to old dotifiles folder, just in case
mv /etc/gitconfig $OLD_DOTFILES/git/gitconfig || true
mv ~/.config/i3/config $OLD_DOTFILES/i3/config || true
mv ~/.config/i3/status $OLD_DOTFILES/i3status/config || true
mv ~/.vimrc $OLD_DOTFILES/.vimrc || true
mv ~/.config/redshift.conf $OLD_DOTFILES/redshift || true

# Link configs inside dotfiles folder into respective folders
ln -f -s ~/.dotfiles/git/gitconfig /etc/gitconfig
ln -f -s ~/.dotfiles/i3/config ~/.config/i3/config
ln -f -s ~/.dotfiles/i3/status ~/.config/i3/status
ln -f -s ~/.dotfiles/.vimrc ~/.vimrc
ln -f -s ~/redshift.conf ~/.config/redshift.conf
