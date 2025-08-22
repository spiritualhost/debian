#!/usr/bin/bash

#User info that will be source'd in the main script to make it easier on repeated runs
#User passwords will not be stored

# User info
USERNAME="ryan"

# System info

DESKTOP_ENV="gnome" #should be y/n -- leave blank for no as of right now
#HOSTNAME="my-server"
#TIMEZONE="America/New_York"

# Dotfiles
DOTFILES_REPO="https://github.com/user/dotfiles.git"

# Packages
# Personalized package list can be copied and pasted over PACKAGES here
PACKAGES=("vim" "neovim" "git" "curl" "zsh" "ufw" "htop")