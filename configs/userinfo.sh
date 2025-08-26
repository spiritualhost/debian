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

##Leave empty for nothing

DESKTOP_ENV="gnome" 



#***Possibly get these ones set up later?
#HOSTNAME="my-server"
#TIMEZONE="America/New_York"


# Dotfiles

##Leave empty for nothing

##The below link is just for testing purposes

DOTFILES_REPO="https://github.com/spiritualhost/Various-Useful-Scripts.git"


# Packages
# Personalized package list can be copied and pasted over PACKAGES here
PACKAGES=("vim" "neovim" "git" "curl" "zsh" "ufw" "htop")


#User scripts
#Logic should go somewhere down here -- it should be an array of filepaths for scripts in the scripts directory (.\scripts)
#There's probably a better way to do this, but this implementation is just to get the script functional.

SCRIPTS=(".\scripts\testscript.sh")

