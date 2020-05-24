#!/bin/sh

# =================
# install homebrew
# =================
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# ====================
# Remove old dot files
# ====================

sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -f ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -f ~/.tmux.conf > /dev/null 2>&1
sudo rm -f ~/.tmux.conf.sh > /dev/null 2>&1
sudo rm -f ~/.color_setting > /dev/null 2>&1
sudo rm -f ~/.zprofile > /dev/null 2>&1
sudo rm -f ~/Brewfile > /dev/null 2>&1

# ===============================
# Create symlinks in the home dir
# ===============================
SYMLINKS=()

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
SYMLINKS+=('.vimrc')

ln -sf ~/dotfiles/mac-tmux/tmux.conf ~/.tmux.conf
SYMLINKS+=('.tmux.conf')

ln -sf ~/dotfiles/mac-tmux/tmux.conf.sh ~/.tmux.conf.sh
SYMLINKS+=('.tmux.conf.sh')

ln -sf ~/dotfiles/shell/color_setting ~/.color_setting
SYMLINKS+=('.color_setting')

ln -sf ~/dotfiles/shell/zprofile ~/.zprofile
SYMLINKS+=('.zprofile')

ln -sf ~/dotfiles/homebrew/Brewfile ~/.Brewfile
SYMLINKS+=('Brewfile')

echo ${SYMLINKS[@]}

#==========================
# install homebrew packages
#==========================
brew bundle --file=~/.Brewfile

#===========================
# All installations are done
#===========================
echo "\n===== All Settings Are Done!! =====\n"
