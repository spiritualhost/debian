#!/usr/bin/bash

#User info that will be source'd in the main script to make it easier on repeated runs
#User passwords will not be stored

# User info
USERNAME="ryan"

# System info

#DE Choices:
## desktop - debian desktop environment
## gnome-desktop - GNOME
## xfce-desktop - Xfce
## gnome-flashback-desktop - GNOME Flashback
## kde-desktop - KDE Plasma
## cinnamon-desktop - Cinnamon
## mate-desktop - MATE
## lxde-desktop - LXDE
## lxqt-desktop - LXQT
## web-server - web server
## ssh-server - SSH server
## laptop - laptop
## blendsel - Choose a Debian Blend for installation

##Multiple tasks can be installed at once if you format as 'DESKTOP_ENV="gnome web-server"', for example

DESKTOP_ENV="gnome" 

#HOSTNAME="my-server"
#TIMEZONE="America/New_York"

# Dotfiles
DOTFILES_REPO="https://github.com/user/dotfiles.git"

# Packages
# Personalized package list can be copied and pasted over PACKAGES here
PACKAGES=("vim" "neovim" "git" "curl" "zsh" "ufw" "htop")